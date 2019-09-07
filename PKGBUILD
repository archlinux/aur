# Maintainer: Tim Aab <trazayuya g-mail>

pkgname="plam"
pkgver=2.2.0
pkgrel=1
pkgdesc="A tool to explore, test and implement various λ-expressions"
arch=('x86_64')
url="https://github.com/sandrolovnicki/pLam"
license=('MIT')
depends=("gmp")
makedepends=("stack")
source=("${url}/archive/v$pkgver.tar.gz")
sha256sums=('7871cd85ad33b0130c31f662340d492ee57a53e0f52e2728060556f49843df73')

build() {
	cd "${srcdir}/pLam-${pkgver}"
    stack build
}

package() {
	cd "${srcdir}/pLam-${pkgver}"
    stack install --local-bin-path "${pkgdir}/usr/bin"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
