# Maintainer: Tim Aab <trazayuya g-mail>

pkgname="plam"
pkgver=2.0.0
pkgrel=1
epoch=
pkgdesc="A tool to explore, test and implement various λ-expressions"
arch=('x86_64')
url="https://github.com/sandrolovnicki/pLam"
license=('MIT')
depends=("ncurses" "gmp")
makedepends=("stack")
source=("${url}/archive/v$pkgver.tar.gz")
sha256sums=('cf8f2401f5d29029cc05b51b7bc90df4f897c12bd4dd1d3242172d3792281a2b')

build() {
	cd "${srcdir}/pLam-${pkgver}"
    stack build
}

package() {
	cd "${srcdir}/pLam-${pkgver}"
    stack install --local-bin-path "${pkgdir}/usr/bin"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
