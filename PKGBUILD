# Maintainer: Tim Aab <trazayuya g-mail>

pkgname="plam"
pkgver=2.1.0
pkgrel=1
epoch=
pkgdesc="A tool to explore, test and implement various λ-expressions"
arch=('x86_64')
url="https://github.com/sandrolovnicki/pLam"
license=('MIT')
depends=("gmp")
makedepends=("stack")
source=("${url}/archive/v$pkgver.tar.gz")
sha256sums=('d60d231e89837720952a348bb85137baf2d485eb59d55e61ae9130848a224970')

build() {
	cd "${srcdir}/pLam-${pkgver}"
    stack build
}

package() {
	cd "${srcdir}/pLam-${pkgver}"
    stack install --local-bin-path "${pkgdir}/usr/bin"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
