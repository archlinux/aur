# Maintainer: Richard Neumann aka. Schard <mail at richard dash neumann period de>
pkgname=xhidecursor
pkgver=0.1.3
pkgrel=1
pkgdesc="Hide the cursor on a running X11 server."
arch=('x86_64')
url="https://github.com/homeinfogmbh/${pkgname}"
license=('MIT')
depends=("libx11" "libxfixes")
makedepends=("cargo")
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('184caeea858248c6673b219b8bbde3540286e76b8b71c312d827b9b87fec02a5')

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
