# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=texturelab-bin
pkgver=0.3.3
pkgrel=2
pkgdesc="Free, Cross-Platform, GPU-Accelerated Procedural Texture Generator"
arch=('x86_64')
url="https://github.com/njbrown/texturelab"
license=('GPL3')
provides=()
depends=('bash' 'electron13')
makedepends=('gendesk')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-v${pkgver}.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/njbrown/texturelab/master/public/icon.png"
    "${pkgname%-bin}.sh")
sha256sums=('eafb5ae20d3df5497c1a5f680ee2438bd2bf0b43bbc4047deb06bd0ab3e68803'
            '627375f6ac09cce1a332e5e28920d074a62f17349f32f16f17f0de3e0239aced'
            '1e13cbbae86cf8f5a77272ff9f59799b7dd684b032028cd3669eee4bad06fce7')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Development;Utility" --name "TextureLab" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}