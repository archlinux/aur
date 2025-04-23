# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=servicemaster-bin
_pkgname=ServiceMaster
pkgver=1.7.6
pkgrel=1
pkgdesc="Linux systemd administration tool with nice TUI written in C.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/Lennart1978/servicemaster"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'ncurses'
)
source=(
    "${pkgname%-bin}-${pkgver}::${url}/releases/download/V${pkgver}/${pkgname%-bin}"
    "${pkgname%-bin}-${pkgver}.toml::https://raw.githubusercontent.com/Lennart1978/servicemaster/V${pkgver}/servicemaster.toml"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Lennart1978/servicemaster/V${pkgver}/LICENSE"
)
sha256sums=('57cf70e0cbf2fa3dc275541d83c52f4ce9f118985c4226fe745db18d3142046c'
            '8311bf54a53b6bc0f194f30da38120e494fef26a0d33121318d26a62be09f0bc'
            '3c3947f498eab4fbf76ee274f3dd6a902e5b3b03f0780ba4b6808fba6c5b9924')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.toml" "${pkgdir}/etc/${pkgname%-bin}/${pkgname%-bin}.toml"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
