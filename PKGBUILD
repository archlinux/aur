# Maintainer: Michael Koloberdin <koloberdin@gmail.com>
pkgname=sjasmplus
pkgver=20190306
pkgrel=1
pkgdesc="SJAsmPlus: Z80 cross-assembler"
arch=(x86_64)
url="https://github.com/sjasmplus/sjasmplus/wiki"
license=(ZLIB)
depends=(boost-libs)
makedepends=(cmake)
source=("https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('a3c06d76079efda74731552e4bd85af7e9067b1026e099669f0d213e132b80ad70e8049cd3ef441fc598305dba0fa17e16500e891abec39c21011ac94826a90c')

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
