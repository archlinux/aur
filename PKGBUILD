# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="ferrum-bin"
pkgver=0.16.11
pkgrel=1
pkgdesc="Music library app for Mac, Linux and Windows"
arch=('x86_64')
url="https://github.com/probablykasper/ferrum"
license=('custom')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('libxrandr' 'pango' 'hicolor-icon-theme' 'cairo' 'glibc' 'libxext' 'alsa-lib' 'gtk3' 'mesa' 'libxcomposite' 'libcups' 'nspr' \
    'libx11' 'at-spi2-core' 'gcc-libs' 'glib2' 'libxcb' 'expat' 'dbus' 'libxkbcommon' 'libxfixes' 'libdrm' 'nss' 'libxdamage')
options=()
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Ferrum-v${pkgver}-linux.deb")
sha256sums=('0a6bce405a762a330d034408ad49acf84a369be008ac30a85b02ab07d3977daf')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    sed "s|Audio|AudioVideo|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/Ferrum/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}