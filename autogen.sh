#! /bin/sh
#
# $Id: autogen.sh,v 1.16 2009-11-15 20:00:56 al-guest Exp $

AUTOMAKEVER=1.16

set -x

aclocal-$AUTOMAKEVER
[ "$?" != 0 ] && echo "aclocal-$AUTOMAKEVER not available or failed!" && exit 1
autoheader || exit 1
automake-$AUTOMAKEVER --add-missing --force --gnu || exit 1
autoconf || exit 1

echo "
now do
\033[1;31m
./configure
sed -ibak -E 's/(.*CCLD.*LINK.*ascii_xfr_OBJECTS.*)/\\1 \$(LTLIBINTL)/g' src/Makefile
make
\033[0m"

