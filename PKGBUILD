# Maintainer: Richard Neumann aka. Schard <mail at richard dash neumann period de>
pkgname=color-code
pkgver=0.1.4
pkgrel=1
pkgdesc="Encode arbitrary bytes to ANSI colors on the console."
arch=('x86_64')
url="https://github.com/coNQP/${pkgname}"
license=('MIT')
makedepends=("cargo")
source=("https://github.com/conqp/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ce7362e2c8e22dc36b94068b4edcbfaf7600ef4d1c9aa30f1bada09483db3a78')

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
