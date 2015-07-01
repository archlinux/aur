# $Id: PKGBUILD, 2012/11/18 21:34:36 wh Exp $
# Contributor niskii <esqueleto_bajo@outlook.com>

pkgname=asap2
pkgver=2.1.2
pkgrel=1
pkgdesc="ASAP - Another Slight Atari Player library (ver 2.x)"
url="http://asap.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL')
source=("http://downloads.sourceforge.net/asap/asap-${pkgver}.tar.gz")
md5sums=('8509335f45a405088626cd58a6808f5c')
conflicts=('asap')

build() {
	cd $startdir/src/asap-$pkgver/

	make
# asapconv
	mkdir -p $startdir/pkg/usr/bin
	install asapconv $startdir/pkg/usr/bin/asapconv
# asap library
	mkdir -p $startdir/pkg/usr/{include,lib}
	install -m 644 asap.h $startdir/pkg/usr/include/asap.h
	install -m 644 libasap.a $startdir/pkg/usr/lib/libasap.a

}
