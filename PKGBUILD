# Maintainer: Gerg0Vagyok <gerg0vagyok@lmao.sbs>

pkgname=runbox
pkgver=0.1.0
pkgrel=2
pkgdesc="A popup runbox for both wayland and x11"
arch=('x86_64')
url="https://gitlab.lmao.sbs/Gerg0Vagyok/RunBox"
license=('MIT')
depends=('qt6-base')
makedepends=('make' 'clang' 'make' 'qt6-base' 'bear')
source=("git+https://gitlab.lmao.sbs/Gerg0Vagyok/RunBox.git#branch=master")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/RunBox"
	make compile
}

package() {
	cd "${srcdir}/RunBox"
	install -Dm755 "bin/runbox" "${pkgdir}/usr/bin/runbox"
	install -Dm644 LICENSE "${pkgdir}/usr/share/license/${pkgname}/LICENSE"
}
