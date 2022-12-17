# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=clipboard
_pkgname=Clipboard
pkgver=0.1.3
pkgrel=1
pkgdesc="Cut, copy, and paste anything in your terminal."
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/Slackadays/Clipboard"
license=('GPL3')
makedepends=('cmake')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('dae1744b8841a673e07c582beddaf104e346d729a5e6df7dcf9bccb30c70228a')

build () {
	cmake -B build -S "${_pkgname}-${pkgver}/src" \
	-DCMAKE_BUILD_TYPE='None' \
	-DCMAKE_INSTALL_PREFIX='/usr' \
	-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
