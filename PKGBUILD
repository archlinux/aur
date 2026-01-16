# Maintainer: fenuks

_pkgname=SwiftLint
pkgname=swiftlint
pkgver=0.63.1
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
sha256sums=('606a9605f79ad0d4e9b7956e1ae007fc87ad3256d5d1922c7e24bdd093f95fab')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    swift build -c release
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    install -dm 755 $pkgdir/usr/bin
    install -Dm 755 .build/release/swiftlint $pkgdir/usr/bin/
}
