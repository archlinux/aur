# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=go-hass-agent-bin
pkgver=14.12.0
pkgrel=1
pkgdesc="A Home Assistant, native app integration for desktop/laptop devices.Written in Go.(Prebuilt version)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://github.com/joshuar/go-hass-agent"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libx11'
    'libglvnd'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.aarch64.rpm")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.armv7.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.x86_64.rpm")
sha256sums_aarch64=('50d6d0bcfbca1047d64960a333256b3d74267a943ea0a9fae287838c433f2807')
sha256sums_armv7h=('2fed9b6296183d1276d591c73c8109a00ba226f68bbf071f71bf3a3a0081a5f9')
sha256sums_x86_64=('f010bad6c9d86449ec889205e8b5cb1b07aa9811c6ce03a2ff5268b50bed50df')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/lib/systemd/user/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/user"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/start-${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/licenses/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
