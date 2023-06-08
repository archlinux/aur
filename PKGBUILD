# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="frappe-books-bin"
pkgver=0.16.0
pkgrel=1
pkgdesc="Modern desktop accounting for freelancers and small-businesses."
arch=('x86_64')
url="https://frappebooks.com/"
_githuburl="https://github.com/frappe/books"
license=('AGPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage" "frappebooks" "frappebooks-appimage")
depends=('alsa-lib' 'gtk3' 'at-spi2-core' 'nss' 'glibc' 'libx11' 'libcups' 'pango' 'libdrm' 'libxext' 'libxrandr' 'nspr' 'glib2' 'libxcomposite' \
    'mesa' 'libxcb' 'gcc-libs' 'dbus' 'expat' 'libxdamage' 'libxfixes' 'libxkbcommon' 'hicolor-icon-theme' 'cairo')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('48f3d2d732115eaa228de544144d8a6f0b7589158856463a090a4802a48efa31')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    sed 's|Finance|Utility|g' -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}