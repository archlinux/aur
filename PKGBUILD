# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rustii-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Command line tool for converting images to ASCII art"
arch=('x86_64')
url="https://crates.io/crates/rustii"
_ghurl="https://github.com/j3dr/rustii"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source=(
    "${pkgname%-bin}-${pkgver}::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/j3dr/rustii/v${pkgver}/LICENSE"
)
sha256sums=('64ba44c458845043673a38c60aab1706741a7e51b1139b0da035d0044c6ba956'
            'd3262cde7597a4bb54e6335ea6ea92df000ddcff689d298a5b54e48d8c92d132')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
