# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="yana-bin"
pkgver=1.0.16
pkgrel=2
pkgdesc="Powerful note-taking app with nested documents, full-text search, rich-text editor, code snippet editor and more"
arch=("x86_64")
url="https://yana.js.org/"
_githuburl="https://github.com/lukasbach/yana"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'at-spi2-core' 'pango' 'glibc' 'libcups' 'dbus' 'glib2' 'gcc-libs' 'libxi' \
    'libxcursor' 'libxrandr' 'gdk-pixbuf2' 'libxcomposite' 'hicolor-icon-theme' 'libx11' 'libdrm' 'expat' \
    'libxrender' 'cairo' 'nspr' 'mesa' 'libxdamage' 'libxfixes' 'libxcb' 'libxext' 'libxtst')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
source=(
    "${pkgname%-bin}-${pkgver}_amd64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('00d2f30dad0342fa59fa228f087bf647cf2fa6fe061aa46ede22a5439d5c23b8'
            'ebb422a6231ddde433e1d601377c455aefcc96cdc27662bd3ce07d08f1110152')
     
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}