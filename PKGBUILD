# Maintainer: Stefan J. Betz <info@stefan-betz.net>
pkgname=subnetcalc
pkgver=2.6.4
pkgrel=1
pkgdesc="Subnet Calculator for IPv4/IPv6"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/dreibh/subnetcalc"
depends=('geoip')
makedepends=('cmake')
source=("https://github.com/dreibh/subnetcalc/archive/refs/tags/subnetcalc-$pkgver.tar.gz")
md5sums=('6e1a0e56061d748f228dec9c6f67e602')
sha512sums=('80fe2391dde48d3ca57ad2f2c737ab9fa54e5d0d85fe531888a7fbefc32372db8c58182fdc88f69030d5d3c0b378f794431e2a11e1c2ec2a6f3b112385170b9f')

build() {
	cd $srcdir/$pkgname-$pkgname-$pkgver
	cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr .
	make
}

package() {
	cd $srcdir/$pkgname-$pkgname-$pkgver
	mkdir -p $pkgdir/usr
	make install
}
