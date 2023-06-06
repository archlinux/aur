# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="raj-browser-bin"
pkgver=2.0.5
pkgrel=1
pkgdesc="A UI and privacy focussed browser for the web from the web."
arch=('x86_64')
license=('custom')
conflicts=("${pkgname%-bin}")
url="https://github.com/Rajaniraiyn/raj-browser"
depends=('nspr' 'libcups' 'libxkbcommon' 'libxrandr' 'libxcb' 'libxcomposite' 'dbus' 'gcc-libs' 'libx11' 'cairo' 'at-spi2-core' 'nss' \
    'gtk3' 'hicolor-icon-theme' 'libxdamage' 'pango' 'alsa-lib' 'glibc' 'wayland' 'libdrm' 'libxfixes' 'glib2' 'libxext' 'expat' 'mesa')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('b0ff6a0abff0fe3f8510aa5f12bae954eab07cb0441ee5971685d3335fa91b79')
package(){
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    sed "s|Utility|Network;Utility|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}