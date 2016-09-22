# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=osmium-tool
pkgver=1.4.0
pkgrel=1
pkgdesc="Command line tool for working with OpenStreetMap data based on the Osmium library"
arch=('i686' 'x86_64')
depends=('boost-libs' 'expat')
makedepends=('cmake' 'libosmium')
url="http://osmcode.org/osmium-tool/"
license=('GPL3')
source=("https://github.com/osmcode/$pkgname/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	make
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}

sha1sums=('3b8f53fea8975ecb2ce19baf4877ad9d1e5661bb')
sha256sums=('115b0e4fb303251a5c8377e9834944a164215f76d0e83867d5e83d52ae2abc1e')
