# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=amphitheatre-desktop-bin
pkgver=23.03.30
_pkgver=23-03-30
pkgrel=1
pkgdesc="Open source GUI application that enables you to interact with Amphitheatre"
arch=('x86_64')
url="https://github.com/amphitheatre-app/desktop"
license=('Apache')
depends=('glibc' 'fontconfig' 'gcc-libs' 'freetype2')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${_pkgver}/${pkgname%-bin}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('bdd376034e4b762a5d841c912270b20a72748cec6dabaa2cecb7a86e0aede80c')
  
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}-${CARCH}-unknown-linux-gnu/${pkgname%-bin}" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${CARCH}-unknown-linux-gnu/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "${pkgname%-bin}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}