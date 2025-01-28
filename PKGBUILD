# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=servicemaster-bin
_pkgname=ServiceMaster
pkgver=1.4.4
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
sha256sums=('61f5111a24a4e5d3826912f97682cc88cc5f11951e7785ea5409e34084fa39a2'
            'e0700a990ed324ecd265aa8730096db225f9a0e795b221541f3b02cbfab47899')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}