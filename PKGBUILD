# Maintainer: fenuks

_pkgname=SwiftLint
pkgname=swiftlint
pkgver=0.43.1
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
sha256sums=('b617feac91d569ed4f4a8aa69586ca2a2b6fc790360a8d74b6ec948ff8625592')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make install PREFIX="${pkgdir}/usr" BINARIES_FOLDER="${pkgdir}/usr/bin"
}
