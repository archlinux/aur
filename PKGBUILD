# Maintainer: Richard Neumann aka. Schard <mail at richard dash neumann period de>
pkgname=color-code
_repo_name="ansi-${pkgname}c"
pkgver=0.4.0
pkgrel=1
pkgdesc="Encode arbitrary bytes to ANSI colors on the console."
arch=('x86_64')
url="https://github.com/coNQP/${_repo_name}"
license=('MIT')
makedepends=("cargo")
source=("${_repo_name}-${pkgver}::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ac1902632a07d7b63d7e212c119b246b5bba579f4a06e3da0d26de5ea4147ed6')

build() {
	cd "${_repo_name}-${pkgver}"
	cargo build --release
}

package() {
	cd "${_repo_name}-${pkgver}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	install "target/release/${_repo_name}" "${pkgdir}/usr/bin"
	install LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
