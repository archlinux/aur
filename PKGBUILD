# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=go-hass-agent-bin
pkgver=9.1.0
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
sha256sums_aarch64=('1affc76133d3835909cf66148ed95335a24f1304c9722111c02b09bd908024ba')
sha256sums_armv7h=('84b578c92a835cb42e0311d1be688dc0f5c3b5c6c7460f2269daaaac37c3ace4')
sha256sums_x86_64=('4f81dd0e1af7a9111dc29f3e3d114ddea2179ef785b606194e8f51fa74a0c420')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/lib/systemd/user/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/user"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/licenses/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}