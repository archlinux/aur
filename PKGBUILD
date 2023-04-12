# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="visualfamilytree-bin"
pkgver=1.4.0
pkgrel=1
pkgdesc="Create a family tree with extensive information and pictures about the individual family members."
arch=('x86_64')
url="https://visualfamilytree.jisco.me"
_githuburl="https://github.com/Jisco/VisualFamilyTree"
license=('custom:freeware')
options=(!strip)
providers=(Jisco)
conflits=("${pkgname%-bin} ${pkgname%-bin}-appimage")
depends=('libxcb' 'hicolor-icon-theme' 'glibc' 'libxcursor' 'libxtst' 'nss' 'gdk-pixbuf2' pango libxdamage nspr \
    'cairo' 'gtk3' 'libglvnd' 'libxi' 'alsa-lib' 'libcups' 'expat' 'at-spi2-core' 'gcc-libs' 'util-linux-libs' \
    'libxss' 'libxext' 'dbus' 'libxfixes' 'libxcomposite' 'libxrender' 'glib2' 'libx11' 'libxrandr')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/VisualFamilyTree.${pkgver}.deb"
    "LICENSE::${_githuburl}/raw/master/README.md")
sha256sums=('2182a8d0554b1c1811c12e43d093300a50fd438e305272e65da2db72d8eabc5a'
            '1e28e02b99e91ce1bf896f3c6694dc1475feea02318d69b371181c1fb8b69d97')
  
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    find "${pkgdir}" -type f -exec chmod 644 {} \;
    chmod +x "${pkgdir}/opt/Visual Family Tree/visual-family-tree"
    find "${pkgdir}/opt" -type d -exec chmod 755 {} \;
}