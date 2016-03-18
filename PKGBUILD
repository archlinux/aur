# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=z80e
pkgver=0.3.1
pkgrel=1
license=('MIT')
pkgdesc='An emulation library and client programs for z80 calculators'
depends=("sdl" "scas")
makedepends=("cmake" "asciidoc")
arch=("i386" "x86_64")
url='https://github.com/KnightOS/z80e'
source=("https://github.com/KnightOS/z80e/archive/${pkgver}.tar.gz")
sha1sums=('73fcb38d6deebc90c3fd0f1560dc16d161d5b22b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake -Denable-sdl=YES -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="$pkgdir/" make install
}
