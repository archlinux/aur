# Maintainer: Richard Neumann aka. Schard <mail at richard dash neumann period de>
pkgname=color-code
_repo_name="ansi-${pkgname}c"
_bin_name="${_repo_name}-cli"
pkgver=1.0.2
pkgrel=1
pkgdesc="Encode arbitrary bytes to ANSI colors on the console."
arch=('x86_64')
url="https://github.com/coNQP/${_repo_name}"
license=('MIT')
makedepends=("cargo")
source=("${_repo_name}-${pkgver}::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c77bec0ff350b35f1d285ead328db5642fb7f6922e74adb59cfeff587dc426f0')

build() {
	cd "${_repo_name}-${pkgver}"
	cargo build --release
}

package() {
	cd "${_repo_name}-${pkgver}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	install "target/release/${_bin_name}" "${pkgdir}/usr/bin"
	install LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
