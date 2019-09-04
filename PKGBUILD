# Maintainer: Tim Aab <trazayuya g-mail>

pkgname="plam"
pkgver=2.1.1
pkgrel=1
epoch=
pkgdesc="A tool to explore, test and implement various λ-expressions"
arch=('x86_64')
url="https://github.com/sandrolovnicki/pLam"
license=('MIT')
depends=("gmp")
makedepends=("stack")
source=("${url}/archive/v$pkgver.tar.gz")
sha256sums=('75aaad84eb5ee2dd088c0730ed01f72569b3c38f71beb1c7a5d4818e1a46f41c')

build() {
	cd "${srcdir}/pLam-${pkgver}"
    stack build
}

package() {
	cd "${srcdir}/pLam-${pkgver}"
    stack install --local-bin-path "${pkgdir}/usr/bin"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
