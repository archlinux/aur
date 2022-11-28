# Maintainer: Richard Neumann aka. Schard <mail at richard dash neumann period de>
pkgname=xhidecursor
pkgver=0.1.0
pkgrel=1
pkgdesc="Hide the cursor on a running X11 server."
arch=('x86_64')
url="https://github.com/homeinfogmbh/${pkgname}"
license=('MIT')
makedepends=("cargo")
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('db66862e4fa0fd5e88f2d3c770b56798bc9b14eb3a73a0512d4fa1ceb88e46d9')

build() {
	cd "${pkgname}-${pkgver}"
	cargo build --release
}

package() {
	cd "${pkgname}-${pkgver}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	install "target/release/${pkgname}" "${pkgdir}/usr/bin"
	install LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
