# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=z80e
pkgver=0.5.3
pkgrel=2
license=('MIT')
pkgdesc='An emulation library and client programs for z80 calculators'
groups=("knightos")
depends=("sdl" "scas")
makedepends=("cmake" "asciidoc")
arch=("x86_64")
url='https://github.com/KnightOS/z80e'
source=("$pkgname-$pkgver.tar.gz::https://github.com/KnightOS/z80e/archive/$pkgver.tar.gz")
md5sums=('871b1d66c749b409f82e8b58c1c5334b')

build() {
	cd "${pkgname}-${pkgver}"
	#echo "TARGET_LINK_LIBRARIES(z80e-sdl SDL2)" >> frontends/sdl/CMakeLists.txt
	cmake -Denable-sdl=YES -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	DESTDIR="$pkgdir" make install
}
