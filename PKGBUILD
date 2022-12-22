# Maintainer: Stefan J. Betz <info@stefan-betz.net>
pkgname=subnetcalc
pkgver=2.4.20
pkgrel=1
pkgdesc="Subnet Calculator for IPv4/IPv6"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/dreibh/subnetcalc"
depends=('geoip')
makedepends=('cmake')
source=("https://github.com/dreibh/subnetcalc/archive/refs/tags/subnetcalc-$pkgver.tar.gz")
md5sums=('5541506500ce1642eae60ee48c3a2597')
sha512sums=('fe8e69ef210e01bc9a9957eb5316709182ee9eaeb511872e1c08df61471aa24a6e9a0389bdc33f1b0030b3abf13336dcc9248e00bed946c81ec9b0a343ff564c')

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
