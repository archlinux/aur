#  Maintainer: Leonardo Miliani <leonardo AT leonardomiliani DOT com>
pkgname=sjasmplus-z00m128
pkgver=1.20.0
pkgrel=1
pkgdesc="SjASMplus is a Z80 cross-assembler"
arch=(x86_64)
url="https://github.com/z00m128/sjasmplus"
license=(BSD)
depends=(glibc)
optdepends=('lua: Lua scripting language'
            'tolua++: integrate C/C++ code with Lua')
conflicts=(sjasmplus)
makedepends=(cmake)
source=("https://github.com/z00m128/sjasmplus/releases/download/v$pkgver/sjasmplus-$pkgver-src.tar.xz")

sha256sums=('37c01c4ee34e22ce11f7359ff42759368a5b3745f1fb9e4ede862026c0ca598a')

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../sjasmplus-$pkgver \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd build
	install -Dm755 sjasmplus "$pkgdir/usr/local/bin/sjasmplus"
}