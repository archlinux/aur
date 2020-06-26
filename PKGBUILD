# Maintainer: Stefan J. Betz <info@stefan-betz.net>
pkgname=subnetcalc
pkgver=2.4.16
pkgrel=1
pkgdesc="Subnet Calculator for IPv4/IPv6"
arch=('i686' 'x86_64')
license=('GPL')
url="https://www.uni-due.de/~be0001/subnetcalc/"
depends=('geoip')
makedepends=('cmake')
source=("https://www.uni-due.de/~be0001/subnetcalc/download/subnetcalc-$pkgver.tar.xz")
md5sums=('e8afbb2b212bbed5644f1298a123c9ea')
sha512sums=('5adbd45963885d6f344dffb6f6c7922e576e4341c5db4c299fca8f1227188aaf2d485dbee947af38c7223dddc95898b6433a67558cc2c8474285630e9036098a')

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
