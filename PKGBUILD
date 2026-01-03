# Maintainer: fenuks

_pkgname=SwiftLint
pkgname=swiftlint
pkgver=0.63.0
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
sha256sums=('b4d53f99bc4e01bd2e933c82bf07ae81114f963fa9a19dae846b9d24aac8bb0d')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    swift build -c release
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    install -dm 755 $pkgdir/usr/bin
    install -Dm 755 .build/release/swiftlint $pkgdir/usr/bin/
}
