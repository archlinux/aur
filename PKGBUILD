# Maintainer: Stefan J. Betz <info@stefan-betz.net>
pkgname=subnetcalc
pkgver=2.4.4
pkgrel=1
pkgdesc="Subnet Calculator for IPv4/IPv6"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.iem.uni-due.de/~dreibh/subnetcalc/"
depends=('geoip')
source=("http://www.iem.uni-due.de/~dreibh/subnetcalc/download/subnetcalc-$pkgver.tar.gz")
md5sums=('4fd262820961ead961edc5317fe5b90f')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=$pkgdir/usr
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	mkdir -p $pkgdir/usr
	make install
}
