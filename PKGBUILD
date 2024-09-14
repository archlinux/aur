# Maintainer: pcrab <pcrab at pcrab dot xyz>

pkgname=swiftformat-bin
pkgver=0.54.5
pkgrel=1
pkgdesc="A command-line tool and Xcode Extension for formatting Swift code"
url="https://github.com/nicklockwood/SwiftFormat"
arch=("x86_64")
license=("MIT")

depends=("swift-language")

source=(
    "${pkgname}_${pkgver}.zip::https://github.com/nicklockwood/SwiftFormat/releases/download/${pkgver}/swiftformat_linux.zip"
    "LICENSE::https://raw.githubusercontent.com/nicklockwood/SwiftFormat/master/LICENSE.md"
)
sha256sums=(
    "51fd3d47a32959d472d0295d199b30ab6e25e0ccaf350dba7c4e3b0ef5fdca90"
    "51ebd00705cfea4ad842a44a983c85b61806548dcbb75fb618acc3e793da1cd4"
)

package() {
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 swiftformat_linux "${pkgdir}/usr/bin/swiftformat"
}
