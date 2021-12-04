# Maintainer: Stefan J. Betz <info@stefan-betz.net>
pkgname=subnetcalc
pkgver=2.4.19
pkgrel=1
pkgdesc="Subnet Calculator for IPv4/IPv6"
arch=('i686' 'x86_64')
license=('GPL')
url="https://www.uni-due.de/~be0001/subnetcalc/"
depends=('geoip')
makedepends=('cmake')
source=("https://www.uni-due.de/~be0001/subnetcalc/download/subnetcalc-$pkgver.tar.xz")
md5sums=('31382eabe15d768691b75b33d282062f')
sha512sums=('00283e8c7f4fbf5bc58d425e98d73e118469d58a88016d6fd17bcdaa73337182f166249ef1778408411b29d0bcde706d618985fa7f7b4df1424d175c689e49cb')

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
