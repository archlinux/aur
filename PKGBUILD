# Maintainer: Sematre <sematre at gmx dot de>
pkgname=typos
pkgver=1.3.1
pkgrel=1

pkgdesc="Source code spell checker."
arch=('any')
url="https://github.com/crate-ci/${pkgname}"
license=('MIT' 'Apache')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('68b1799d312255ff3ed2b9176e1a011ffc9f9c338f46e77d49a0f2b5cfe50666')

build() {
	cd "${pkgname}-${pkgver}"
	cargo build --release --locked
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
	install -Dm644 "LICENSE-MIT"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
