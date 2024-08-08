# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=servicemaster-bin
_pkgname=ServiceMaster
pkgver=1.2
pkgrel=1
pkgdesc="Linux systemd administration tool with nice TUI written in C."
arch=("x86_64")
url="https://github.com/Lennart1978/servicemaster"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source=(
    "${pkgname%-bin}-${pkgver}::${url}/releases/download/V${pkgver}/${pkgname%-bin}"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Lennart1978/servicemaster/V${pkgver}/LICENSE"
)
sha256sums=('75b77e3674ec7dfac819dece01568ec9d3d1f50da7fe600424e19dae80368b93'
            'e0700a990ed324ecd265aa8730096db225f9a0e795b221541f3b02cbfab47899')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}