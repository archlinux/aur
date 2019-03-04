# Maintainer: Michael Koloberdin <koloberdin@gmail.com>
pkgname=sjasmplus
pkgver=20190304.2
pkgrel=1
pkgdesc="SJAsmPlus: Z80 cross-assembler"
arch=(x86_64)
url="https://github.com/sjasmplus/sjasmplus/wiki"
license=(ZLIB)
depends=(boost-libs)
makedepends=(cmake)
source=("https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('2543a3188a4516bfcf3dccc776372a6899463945026d453131ec4ea92cea43b8e8802f9759083397b6052f74e887b35ff22aa4adf2cfd8bc92f1534be2e258c7')

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
