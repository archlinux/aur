# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=acast-bin
_pkgname=asciinema
pkgver=0.4.0
pkgrel=2
pkgdesc="A free and open source solution for recording terminal sessions and sharing them on the web.(Prebuilt version)一个免费开源的终端会话录制和分享工具"
arch=(
    'aarch64'
    'x86_64'
)
url="https://asciinema.org/"
_ghurl="https://github.com/gvcgo/asciinema"
license=('MIT')
provides=("${_pkgname}")
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}"
)
depends=()
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/gvcgo/asciinema/v${pkgver}/LICENSE"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux-amd64.zip")
sha256sums=('7c7fdee1ffc06fe95ad9f1179188bab5c7a37f360b5876c8f13670d1ba3af22c')
sha256sums_aarch64=('6653dd5dc8a32ce1221b3216e743b34bda74cfb4de543c47086d559a3b31b76e')
sha256sums_x86_64=('8956ae3141a8916c035099b9c096ab68643d2f8e50e2c18af4b2645171cc8c45')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}