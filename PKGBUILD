# Maintainer: Stefan J. Betz <info@stefan-betz.net>
pkgname=subnetcalc
pkgver=2.4.15
pkgrel=1
pkgdesc="Subnet Calculator for IPv4/IPv6"
arch=('i686' 'x86_64')
license=('GPL')
url="https://www.uni-due.de/~be0001/subnetcalc/"
depends=('geoip')
makedepends=('cmake')
source=("https://www.uni-due.de/~be0001/subnetcalc/download/subnetcalc-$pkgver.tar.xz")
md5sums=('c3db6b1d569f847d27f3801a0a2e5800')
sha512sums=('b2c7c39073a4e63d5b3c3930fa80bf1148b6759c1d7940552222f9d28b8c642acaded19ed91e6b5fc30d76303c75510ddf93636c838d4fc2bb0cc0734d5ee5ae')

build() {
	cd $srcdir/$pkgname-$pkgver
	cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr .
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	mkdir -p $pkgdir/usr
	make install
}
