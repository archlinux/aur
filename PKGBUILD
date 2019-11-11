# Maintainer: fenuks

_pkgname=SwiftLint
pkgname=swiftlint
pkgver=0.37.0
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
sha256sums=('4a28b217ec6b3bdd1ede2fc78587305bbd20a30aa06f049adb243d5efbabab12')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make install PREFIX="${pkgdir}/usr" BINARIES_FOLDER="${pkgdir}/usr/bin"
}
