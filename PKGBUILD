# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=refi-app-bin
pkgver=0.0.19
pkgrel=2
pkgdesc="A tool to make interacting with Firestore less painful"
arch=('x86_64')
url="https://refiapp.io/"
_githuburl="https://github.com/thanhlmm/refi-app"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('libdrm' 'glibc' 'gdk-pixbuf2' 'gcc-libs' gtk3 'hicolor-icon-theme' 'mesa' 'libdrm' 'cairo' 'expat' 'libxrandr' \
    'libxcb' 'nspr' 'nodejs' 'libxext' 'sh' 'dbus' 'nss' 'at-spi2-core' 'libx11' 'libxkbcommon' 'libxshmfence' 'pango' \
    'libcups' 'alsa-lib' 'libxdamage' 'libxfixes' 'glib2' 'libxcomposite')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/thanhlmm/refi-app/main/LICENSE")
sha256sums=('01918b95b8109d2c02b0a2b517a5f59f8f795b02a02557cfd420f80fbd345dc4'
            'b2eb77a849db152dcb5ed71c597000a5dc3638559aefae0b5aa3454e8d7abe71')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}