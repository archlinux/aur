# Maintainer: Michael Koloberdin <koloberdin@gmail.com>
pkgname=sjasmplus
pkgver=20190306.1
pkgrel=1
pkgdesc="SJAsmPlus: Z80 cross-assembler"
arch=(x86_64)
url="https://github.com/sjasmplus/sjasmplus/wiki"
license=(ZLIB)
depends=(boost-libs)
makedepends=(cmake)
source=("https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('7a97c73661d25d96a8a0ec137f6440b640d1388e3452525219deb09c37905d2279b981016280dc11dfe014bd710581a568120475b2e286afd3f3d519134106b5')

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../$pkgname-$pkgver \
		-DCMAKE_BUILD_TYPE=Release
	make -j
}

package() {
	cd build
	install -Dm755 sjasmplus "$pkgdir/usr/bin/sjasmplus"
}
