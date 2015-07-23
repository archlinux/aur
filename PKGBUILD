# Maintainer: Felix Yan <felixonmars[at]gmail[dot]com>
# Contributor Luca Gervasi <luca.gervasi on GMAIL>
#
# $Id$

pkgname=vrrpd-fredb
pkgver=1.5_02
_fullname=Vrrpd-FredB-$pkgver-2012
pkgrel=1
pkgdesc="Linux implementation of Virtual Router Redundancy Protocol - Unofficial Version by FredB"
arch=('i686' 'x86_64')
url="http://vrrpd.sf.net/"
license=('GPL')
provides=(vrrpd)
conflicts=(vrrpd)

source=(http://downloads.sourceforge.net/vrrpd/vrrpd/Unofficial/${_fullname}.tar.gz)
md5sums=('53a4120410bb877698871fb6fb88ea9c')
build() {
	cd $srcdir/$_fullname
	make
}

package() {
	cd $srcdir/$_fullname
	install -Dm755 vrrpd $pkgdir/usr/bin/vrrpd
	install -Dm644 vrrpd.8 $pkgdir/usr/share/man/man8/vrrpd.8
}

