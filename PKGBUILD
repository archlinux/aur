# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=go-hass-agent-bin
_pkgname="Go Hass Agent"
pkgver=7.2.0
pkgrel=1
pkgdesc="A Home Assistant， native app integration for desktop/laptop devices."
arch=("x86_64")
url="https://github.com/joshuar/go-hass-agent"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libx11'
    'libglvnd'
)
source=(
    "${pkgname%-bin}-${pkgver}.pkg.tar.zst::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1-${CARCH}.pkg.tar.zst"
)
sha256sums=('e8d06c3cdb97abc81aed23aa9603e4345c2c5a206973f537792f967936576d8c')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/lib/systemd/user/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/user"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/licenses/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}