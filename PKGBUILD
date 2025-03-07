# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=servicemaster-bin
_pkgname=ServiceMaster
pkgver=1.7.0
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
    "${pkgname%-bin}-${pkgver}::${url}/releases/download/V${pkgver}/${pkgname%-bin}"
    "${pkgname%-bin}-${pkgver}.toml::https://raw.githubusercontent.com/Lennart1978/servicemaster/V${pkgver}/servicemaster.toml"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Lennart1978/servicemaster/V${pkgver}/LICENSE"
)
sha256sums=('d3ff5f1adb71978e2138e9ddf9d90d874092394b3fd01bb64cff0a42da68de6f'
            'ab23c1a3110ad1f792da6d13899315dd415dcc3e0934a070389893475348dd44'
            '3c3947f498eab4fbf76ee274f3dd6a902e5b3b03f0780ba4b6808fba6c5b9924')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.toml" "${pkgdir}/etc/${pkgname%-bin}/${pkgname%-bin}.toml"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}