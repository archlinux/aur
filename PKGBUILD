# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nuiuita-bin
_pkgname='Nu-i uita'
pkgver=0.1.0
pkgrel=1
pkgdesc="Minimalist password manager desktop app made with Golang-Wails & Svelte.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/emarifer/Nu-i-uita"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=()
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_${CARCH}.tar.xz"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/emarifer/Nu-i-uita/v${pkgver}/LICENSE"
)
sha256sums=('1d974382c620f2c4add706af5f3e26b6f90ae1d59511bebb3765e5c7ab56e795'
            'cdf91bbd5ea3ee229dced263d715da1bf03bb676c4348baed0ad775ee3391929')
package() {
    install -Dm755 "${srcdir}/usr/local/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/local/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/local/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
