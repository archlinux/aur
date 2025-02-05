# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=servicemaster-bin
_pkgname=ServiceMaster
pkgver=1.4.5
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
sha256sums=('2aff45cb132b146d126ee9ed02134eb170b2ed0addb6a4243bc530fd7642f162'
            'e0700a990ed324ecd265aa8730096db225f9a0e795b221541f3b02cbfab47899')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}