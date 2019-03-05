# Maintainer: Michael Koloberdin <koloberdin@gmail.com>
pkgname=sjasmplus
pkgver=20190304.3
pkgrel=1
pkgdesc="SJAsmPlus: Z80 cross-assembler"
arch=(x86_64)
url="https://github.com/sjasmplus/sjasmplus/wiki"
license=(ZLIB)
depends=(boost-libs)
makedepends=(cmake)
source=("https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('ac17c1a6db7bd567089dea3f4a85b83c2725734af36e463911a1b25154b4d19fd2765e258adc140b7281e1331bc38c606b036e953ea946b80c150444e2123024')

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
