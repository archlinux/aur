# Maintainer: Michael Koloberdin <koloberdin@gmail.com>
pkgname=sjasmplus
pkgver=20190304
pkgrel=1
pkgdesc="SJAsmPlus: Z80 cross-assembler"
arch=(x86_64)
url="https://github.com/sjasmplus/sjasmplus/wiki"
license=(ZLIB)
depends=(boost-libs)
makedepends=(cmake)
source=("https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('ffc035c55a2b3168e6e308b9c46cc8031d56adcb0079423322cd3b447b754c9b6a64a99a26c72f26a5008461a20b36f1402d5ee7ce5ab874c1ae8493d0440d4f')

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
