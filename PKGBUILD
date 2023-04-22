# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="boostchanger-bin"
pkgver=5.0.2
pkgrel=3
pkgdesc="With this app you can control CPU turbo boost and the settings of the cpu speed in order to consuming less battery voltage on Linux"
arch=('x86_64')
url="https://github.com/nbebaw/boostchanger"
license=('MIT')
providers=()
conflits=("${pkgname%-bin}-git" "${pkgname%-bin}-py" "${pkgname%-bin}-appimage")
depends=('at-spi2-core' 'alsa-lib' 'gtk3' 'nss' 'glibc' 'cairo' 'mesa' 'libxrandr' 'libxcomposite' \
        'libxfixes' 'pango' 'nspr' 'libxdamage' 'libdrm' 'libcups' 'expat' 'libxcb' 'dbus' 'gcc-libs' \
        'glib2' 'libxext' 'libx11' 'libxkbcommon' 'hicolor-icon-theme')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.pacman"
    "LICENSE::${url}/raw/master/LICENSE")
sha256sums=('f35cd372a2fdfd941cc4e579aacc686ae9fe68cf59cf796dfc7219ad283b1859'
            'af8aec94b8f5c88f4c4e4435570b94d143970c621048db7e25f27403fa4ec02e')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/icons/hicolor/0x0" "${pkgdir}/usr/share/icons/hicolor/1024x1024"
}