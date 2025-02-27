# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=servicemaster-bin
_pkgname=ServiceMaster
pkgver=1.5.1
pkgrel=1
pkgdesc="Linux systemd administration tool with nice TUI written in C."
arch=("x86_64")
url="https://github.com/Lennart1978/servicemaster"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'ncurses'
    'systemd-libs'
)
source=(
    "${pkgname%-bin}-${pkgver}::${url}/releases/download/V${pkgver//_/-}/${pkgname%-bin}"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Lennart1978/servicemaster/V${pkgver//_/-}/LICENSE"
)
sha256sums=('4ab7469b3f39471e0e5e2f782b62f8f99d8c3591b6e5e7a58c8f49d661268604'
            'e0700a990ed324ecd265aa8730096db225f9a0e795b221541f3b02cbfab47899')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}