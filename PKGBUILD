# Maintainer: Richard Neumann aka. Schard <mail at richard dash neumann period de>
pkgname=color-code
pkgver=0.2.7
pkgrel=1
pkgdesc="Encode arbitrary bytes to ANSI colors on the console."
arch=('x86_64')
url="https://github.com/coNQP/${pkgname}"
license=('MIT')
makedepends=("cargo")
source=("https://github.com/conqp/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d2a293d7d97544f7993b27847ebe199c9d645b87f084c3badfd66faef56dfc54')

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
