# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=acast-bin
_pkgname=asciinema
pkgver=0.3.9
pkgrel=1
pkgdesc="A free and open source solution for recording terminal sessions and sharing them on the web.一个免费开源的终端会话录制和分享工具"
arch=(
    "aarch64"
    "x86_64"
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
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/gvcgo/asciinema/main/LICENSE"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux-amd64.zip")
sha256sums=('7c7fdee1ffc06fe95ad9f1179188bab5c7a37f360b5876c8f13670d1ba3af22c')
sha256sums_aarch64=('7f0ff216b737901f28d0f909c7f8e0d9576d633a66bfbe97ae37e57551979dde')
sha256sums_x86_64=('70136c9e10b7dcf53ef9dcbb28dc4dc22f494f175f06b988c367849ad892dfcb')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}