# Maintainer: Stefan J. Betz <info@stefan-betz.net>
pkgname=subnetcalc
pkgver=2.4.7
pkgrel=1
pkgdesc="Subnet Calculator for IPv4/IPv6"
arch=('i686' 'x86_64')
license=('GPL')
url="https://www.uni-due.de/~be0001/subnetcalc/"
depends=('geoip')
source=("https://www.uni-due.de/~be0001/subnetcalc/download/subnetcalc-$pkgver.tar.gz")
md5sums=('5c5731347bb3a9b0dd29f86014e58be3')

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
