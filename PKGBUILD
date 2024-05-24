# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=go-hass-agent-bin
pkgver=9.2.0
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
sha256sums_aarch64=('638004a7400eccc32e0cf7e7fbca8efddfefa3c7836c7259543b3d2fc9514545')
sha256sums_armv7h=('515150547a9cffd46052b765da0ed5e068197a6caa01d6c28e75d80e8afabdaa')
sha256sums_x86_64=('6cab35b48d959307445d468c735b6110122a16ab8bfea4cbe8722705f2b99921')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/lib/systemd/user/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/user"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/licenses/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}