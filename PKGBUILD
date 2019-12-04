# Maintainer: fenuks

_pkgname=SwiftLint
pkgname=swiftlint
pkgver=0.38.0
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
sha256sums=('57ff2c1b365e13c87348788c09107b4de5be3679b158cffa42ea484b723c5594')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make install PREFIX="${pkgdir}/usr" BINARIES_FOLDER="${pkgdir}/usr/bin"
}
