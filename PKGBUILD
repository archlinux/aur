# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=go-hass-agent-bin
pkgver=13.3.2
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
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.armv7hl.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.x86_64.rpm")
sha256sums_aarch64=('c3f80ca55a747997ef3d7af3e1097db66384c3206ea1c7f5dd9e580bf5bd67bf')
sha256sums_armv7h=('9807b1cdcc92c5bb63b8c4eccf41d2bb024dbceb259e24ad8c77554b3a6f3a46')
sha256sums_x86_64=('97470d1d5dcbd0af972198d98b71bb59c6c02919dc9fa1d6e2302fd1bd878bd8')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/lib/systemd/user/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/user"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/licenses/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
