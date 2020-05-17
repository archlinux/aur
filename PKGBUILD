# Maintainer: 
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Felix Yan <felixonmars[at]gmail[dot]com>
# Contributor Luca Gervasi <luca.gervasi on GMAIL>
#
# $Id$

pkgname=vrrpd-fredb
pkgver=1.15
_fullname=Vrrpd-${pkgver}
pkgrel=1
pkgdesc="Linux implementation of Virtual Router Redundancy Protocol - Unofficial Version by FredB"
arch=('i686' 'x86_64')
url="https://github.com/fredbcode/Vrrpd"
license=('GPL')
provides=(vrrpd)
conflicts=(vrrpd)

source=(https://github.com/fredbcode/Vrrpd/archive/v${pkgver}.tar.gz)
sha256sums=('9f4000c4df8b2b7d3afd0fbb1eb9876958e4837daf1d7e3ce42b01cc154c2849')
build() {
	cd $srcdir/$_fullname
	make
}

package() {
	cd $srcdir/$_fullname
	install -Dm755 vrrpd $pkgdir/usr/bin/vrrpd
	install -Dm644 vrrpd.8 $pkgdir/usr/share/man/man8/vrrpd.8
}

