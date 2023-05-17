# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rekordfix-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="GUI tool for missing functionality to manage a Rekordbox collection"
arch=('x86_64')
url="https://github.com/rzuppur/rekordfix"
license=('MIT')
depends=('hicolor-icon-theme' 'gcc-libs' 'glibc' 'libxcb' 'at-spi2-core' 'dbus' 'libcups' 'libxrandr' 'pango' 'libx11' 'libxdamage' \
    'expat' 'gtk3' 'mesa' 'cairo' 'alsa-lib' 'glib2' 'libxkbcommon' 'libxfixes' 'libdrm' 'libxcomposite' 'nspr' 'nss' 'libxext')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
   "LICENSE::https://raw.githubusercontent.com/rzuppur/rekordfix/main/LICENSE")
sha256sums=('4a6ef8fe7dcfb208bbee5c2f5bcbf3711967fd01872dc0ace70d3b68650f876b'
            'ac76bfd52440815cb3e8ec5ea00f1f9b82c9b404219814f2f05c3fe44a9446c5')
 
package() {
   bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --gname root --uname root
   install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}