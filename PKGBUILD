# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=go-hass-agent-bin
pkgver=9.0.0
pkgrel=1
pkgdesc="A Home Assistant， native app integration for desktop/laptop devices."
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.pkg.tar.zst::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1-aarch64.pkg.tar.zst")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.pkg.tar.zst::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1-armv7h.pkg.tar.zst")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.pkg.tar.zst::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums_aarch64=('44593302007c2a503704d23edfa9e69571e31bc0b42af7a4bf8920d89846f05c')
sha256sums_armv7h=('af0794a4bdb95bacff9375885ba7a2883b9887b6c27f84c977773a4af9218d71')
sha256sums_x86_64=('5e395df59461b34b05595daae1d2291e698dd89244b6606489aceed38224a582')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/lib/systemd/user/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/user"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/licenses/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}