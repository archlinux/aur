# Maintainer: Richard Neumann aka. Schard <mail at richard dash neumann period de>
pkgname=color-code
pkgver=0.1.7
pkgrel=1
pkgdesc="Encode arbitrary bytes to ANSI colors on the console."
arch=('x86_64')
url="https://github.com/coNQP/${pkgname}"
license=('MIT')
makedepends=("cargo")
source=("https://github.com/conqp/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ffd1d2df7239b2826e2ef8938c6df10e792ce85016128cfececd486748ac6e9b')

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
