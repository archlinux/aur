# Maintainer: fenuks

_pkgname=SwiftLint
pkgname=swiftlint
pkgver=0.42.0
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
sha256sums=('48f857739732048afb968c2b2eeee4400aa9da21e543e67a0a87d87cd98dad6e')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make install PREFIX="${pkgdir}/usr" BINARIES_FOLDER="${pkgdir}/usr/bin"
}
