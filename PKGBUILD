# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="before-dawn-bin"
pkgver=0.22.0
pkgrel=1
pkgdesc="A desktop screensaver app using web technologies"
arch=('x86_64')
url="https://github.com/muffinista/before-dawn"
license=('MIT')
conflits=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('libxcb' 'glibc' 'nss' 'pango' 'libcups' 'libxfixes' 'gtk3' 'libxkbcommon' 'nspr' 'dbus' 'libxdamage' 'alsa-lib' \
    'libxrandr' 'hicolor-icon-theme' 'mesa' 'libx11' 'libxext' 'cairo' 'glib2' 'libdrm' 'expat' 'libxcomposite' 'at-spi2-core' 'gcc-libs')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE.txt::https://raw.githubusercontent.com/muffinista/before-dawn/main/LICENSE.txt")
sha256sums=('1db51ef9ab8266370a00ea867e236a12629151d79eaa733066a9d81f38d6d37b'
            '2f9c033e00d3ac09f44d4819c7701eae9c37ca21ca1da29f3488eadc1b3c3c51')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}