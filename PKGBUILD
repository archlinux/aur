# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=servicemaster-bin
_pkgname=ServiceMaster
pkgver=1.6.6
pkgrel=1
pkgdesc="Linux systemd administration tool with nice TUI written in C.(Prebuilt version)"
arch=("x86_64")
url="https://github.com/Lennart1978/servicemaster"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'ncurses'
)
source=(
    "${pkgname%-bin}-${pkgver}::${url}/releases/download/V${pkgver//_/-}/${pkgname%-bin}"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Lennart1978/servicemaster/V${pkgver//_/-}/LICENSE"
)
sha256sums=('1416c33889d29a15033cdc8dc33ce85de72ce8087a40b00b6ad400e5cb9a7d46'
            '3c3947f498eab4fbf76ee274f3dd6a902e5b3b03f0780ba4b6808fba6c5b9924')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}