# Maintainer: Stefan J. Betz <info@stefan-betz.net>
pkgname=subnetcalc
pkgver=2.4.14
pkgrel=1
pkgdesc="Subnet Calculator for IPv4/IPv6"
arch=('i686' 'x86_64')
license=('GPL')
url="https://www.uni-due.de/~be0001/subnetcalc/"
depends=('geoip')
makedepends=('cmake')
source=("https://www.uni-due.de/~be0001/subnetcalc/download/subnetcalc-$pkgver.tar.xz")
md5sums=('c1a9f68becda50fa9212d9580ed4760c')
sha512sums=('afd998cc9a3dfc626f7c6b6a12d6f1bc91fd73c9cdef59b80cb285a39f796741812606a3959756f16cca608159266658ec180e3ae3faf1ecdda2e8fda97a45ef')

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
