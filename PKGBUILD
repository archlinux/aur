#Maintainer: robertfoster

_pkg=sunxi-awusb
pkgname=${_pkg}-dkms
pkgver=0.5
pkgrel=1
pkgdesc="DKMS module for Allwinner devices"
arch=('i686' 'x86_64')
url="https://github.com/linux-sunxi/sunxi-livesuite"
license=('GPL')
depends=('dkms')
makedepends=('git')
conflicts=('cubieboard-livesuit')
source=('git+https://github.com/M0Rf30/sunxi-awusb.git')

package() {
	cd $srcdir/${_pkg}
	install -Dt "$pkgdir/usr/src/${_pkg}-$pkgver" -m644 awusb.c Makefile dkms.conf
	install -Dt "$pkgdir/usr/lib/udev/rules.d/" -m644 udev/50-awusb.rules
}

md5sums=('SKIP')
