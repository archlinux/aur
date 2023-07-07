# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="boostchanger-bin"
pkgver=5.0.2
pkgrel=4
pkgdesc="With this app you can control CPU turbo boost and the settings of the cpu speed in order to consuming less battery voltage on Linux"
arch=('x86_64')
url="https://github.com/nbebaw/boostchanger"
license=('MIT')
provides=("${pkgname%-bin}")
conflits=("${pkgname%-bin}")
depends=('electron')
source=("${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.pacman"
    "LICENSE::https://raw.githubusercontent.com/nbebaw/boostchanger/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('f35cd372a2fdfd941cc4e579aacc686ae9fe68cf59cf796dfc7219ad283b1859'
            'af8aec94b8f5c88f4c4e4435570b94d143970c621048db7e25f27403fa4ec02e'
            '026833f93eb9a0a53a5e9c4f5bd039a42cb7c1ea635b521c894b0a88adefbea5')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" 
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}