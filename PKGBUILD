# Maintainer: Richard Neumann aka. Schard <mail at richard dash neumann period de>
pkgname=color-code
_repo_name="ansi-${pkgname}c"
pkgver=0.5.4
pkgrel=1
pkgdesc="Encode arbitrary bytes to ANSI colors on the console."
arch=('x86_64')
url="https://github.com/coNQP/${_repo_name}"
license=('MIT')
makedepends=("cargo")
source=("${_repo_name}-${pkgver}::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bd58fb854b54c3c52c368bafab0c538e19d20ad5abcd1a01000539afd1ecebfa')

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
