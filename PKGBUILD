# Maintainer: Richard Neumann aka. Schard <mail at richard dash neumann period de>
pkgname=color-code
pkgver=0.1.0
pkgrel=1
pkgdesc="Encode arbitrary bytes to ANSI colors on the console."
arch=('x86_64')
url="https://github.com/coNQP/${pkgname}"
license=('MIT')
makedepends=("cargo" "rustup")
source=("https://github.com/conqp/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('850187628bbda556c2b206e7cccfbc7c884da6a0a9e77435ea3cae5ad41ddf42')

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
