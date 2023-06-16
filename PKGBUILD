# Maintainer: Richard Neumann aka. Schard <mail at richard dash neumann period de>
pkgname=xhidecursor
pkgver=0.1.1
pkgrel=1
pkgdesc="Hide the cursor on a running X11 server."
arch=('x86_64')
url="https://github.com/homeinfogmbh/${pkgname}"
license=('MIT')
depends=("libx11" "libxfixes")
makedepends=("cargo")
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('54f8f76728267ee24f5cdcd6b21250df685ff64f0af191ea1f337ba8d933c9aa')

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
