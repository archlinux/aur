# Maintainer: Richard Neumann aka. Schard <mail at richard dash neumann period de>
pkgname=color-code
_repo_name="ansi-${pkgname}c"
pkgver=0.3.0
pkgrel=1
pkgdesc="Encode arbitrary bytes to ANSI colors on the console."
arch=('x86_64')
url="https://github.com/coNQP/ansi-${_repo_name}c"
license=('MIT')
makedepends=("cargo")
source=("https://github.com/conqp/${_repo_name}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('73b80e3b38cf1440e6f474dd37edf15ecaf2f6e78306c3fa670e9b37ceb57618')

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
