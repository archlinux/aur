# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=z80e
pkgver=0.4.0
pkgrel=1
license=('MIT')
pkgdesc='An emulation library and client programs for z80 calculators'
depends=("sdl" "scas")
makedepends=("cmake" "asciidoc")
arch=("i386" "x86_64")
url='https://github.com/KnightOS/z80e'
source=("https://github.com/KnightOS/z80e/archive/${pkgver}.tar.gz")
sha1sums=('f8c5eccbf3f0989bbdfdd35f1ab1b4e3d1895e85')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake -Denable-sdl=YES -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="$pkgdir/" make install
}
