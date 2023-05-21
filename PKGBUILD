# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="bcrypt-sandbox-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool for encrypting and validating text with bcrypt"
arch=('x86_64')
url="https://felladrin.github.io/bcrypt-sandbox"
_githuburl="https://github.com/felladrin/bcrypt-sandbox"
license=('MIT')
conflicts=("${pkgname%-bin}")
depends=('gcc-libs' 'gtk3' 'glibc' 'webkit2gtk' 'glib2')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-linux.zip"
        "LICENSE.txt::https://raw.githubusercontent.com/felladrin/bcrypt-sandbox/master/LICENSE.txt")
sha256sums=('9b1675cb7f13d3bfa2ade85fd0821c42d106d23b7e7b66e8682dc256a5a0b61d'
            '9fefa7c0ffe3e72fa6f422498c7a892ba6ef9360e84f3892448c2ebe9d04ba70')
  
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/Bcrypt Sandbox/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/storage/iconfile.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    chmod 755 "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    gendesk -f --icon "${pkgname%-bin}" --categories "Utility;System" --name "Bcrypt Sandbox" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}