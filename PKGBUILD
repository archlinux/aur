# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=osmium-tool
pkgver=1.4.1
pkgrel=1
pkgdesc="Command line tool for working with OpenStreetMap data based on the Osmium library"
arch=('i686' 'x86_64')
depends=('boost-libs' 'expat')
makedepends=('cmake' 'libosmium>=2.9.0')
url="http://osmcode.org/osmium-tool/"
license=('GPL3')
source=("https://github.com/osmcode/$pkgname/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
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

sha1sums=('1908b4f54a650a49e99ee7ec9621b4bc17818e39')
sha256sums=('1263a2836df59874c733d22184027ae414372682e28f80725cacdc3b2e4b8b64')
