# Maintainer: fenuks

_pkgname=SwiftLint
pkgname=swiftlint
pkgver=0.64.1
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
sha256sums=('dfd88248b09813e7edb775b73f2180f3964e5d53fc0131bd4cf3ffcbfb839c06')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    swift build -c release
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    install -dm 755 $pkgdir/usr/bin
    install -Dm 755 .build/release/swiftlint $pkgdir/usr/bin/
}
