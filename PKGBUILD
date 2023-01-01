# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=clipboard
_pkgname=Clipboard
pkgver=0.2.0
pkgrel=1
pkgdesc="Cut, copy, and paste anything in your terminal."
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/Slackadays/Clipboard"
license=('GPL3')
makedepends=('cmake')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('353a6bf459c64284bfbbdd40b59c8b17061d901c26fa58af5761f47b29fc18b5')

build () {
	cmake -B build -S "${_pkgname}-${pkgver}" \
	-DCMAKE_BUILD_TYPE='None' \
	-DCMAKE_INSTALL_PREFIX='/usr' \
	-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
