# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=servicemaster-bin
_pkgname=ServiceMaster
pkgver=1.6.1
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
sha256sums=('edab0037f09136f5f1ca857c0e92ebe649d9fa93812e7b8acf641ad7c2746574'
            '3c3947f498eab4fbf76ee274f3dd6a902e5b3b03f0780ba4b6808fba6c5b9924')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}