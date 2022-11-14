# Maintainer: Richard Neumann aka. Schard <mail at richard dash neumann period de>
pkgname=color-code
_repo_name="ansi-${pkgname}c"
pkgver=0.3.4
pkgrel=1
pkgdesc="Encode arbitrary bytes to ANSI colors on the console."
arch=('x86_64')
url="https://github.com/coNQP/ansi-${_repo_name}c"
license=('MIT')
makedepends=("cargo")
source=("https://github.com/conqp/${_repo_name}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('85ebb4e0f28eac3af10fd95007517b1229649e69ada49e9183b02017f5e3389c')

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
