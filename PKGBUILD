# Maintainer: fenuks

_pkgname=SwiftLint
pkgname=swiftlint
pkgver=0.58.2
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
sha256sums=('f9ac2edd40d4a10885e6d9897fb65545b4644cc44c00a101e046bf08911f6e94')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    swift build -c release
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    install -dm 755 $pkgdir/usr/bin
    install -Dm 755 .build/release/swiftlint $pkgdir/usr/bin/
}
