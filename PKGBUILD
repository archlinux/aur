#  Maintainer: Leonardo Miliani <leonardo AT leonardomiliani DOT com>
pkgname=sjasmplus-z00m128
pkgver=1.20.2
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

sha256sums=('34421abd754639a5add999ef194dbd215aed92ac445eea7981ee46438021870f')

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