# Maintainer: fenuks

_pkgname=SwiftLint
pkgname=swiftlint
pkgver=0.47.1
pkgrel=1
pkgdesc="A tool to enforce Swift style and conventions."
arch=("i686" "x86_64")
url="https://github.com/realm/SwiftLint"
license=("MIT")
depends=("swift-language")
optdepends=()
makedepends=()
conflicts=("${pkgname}")
# options=()
# install=$pkgname.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/realm/SwiftLint/archive/${pkgver}.tar.gz")
sha256sums=('cb9668b83a38aff15cdc213227b06087fe08927741d3d7c0dc3bfb9db3dbb66a')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make install PREFIX="${pkgdir}/usr" BINARIES_FOLDER="${pkgdir}/usr/bin"
}
