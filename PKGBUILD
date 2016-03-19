# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=z80e
pkgver=0.3.2
pkgrel=1
license=('MIT')
pkgdesc='An emulation library and client programs for z80 calculators'
depends=("sdl" "scas")
makedepends=("cmake" "asciidoc")
arch=("i386" "x86_64")
url='https://github.com/KnightOS/z80e'
source=("https://github.com/KnightOS/z80e/archive/${pkgver}.tar.gz")
sha1sums=('2e862580f29897120a4be6865a2e5bafa6a72efa')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake -Denable-sdl=YES -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="$pkgdir/" make install
}
