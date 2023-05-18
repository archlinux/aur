# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="alphabiz-bin"
pkgver=0.2.4
pkgrel=1
pkgdesc="Web3 ecosystem - enable developers to build fully decentralized media platform and blockchain-based marketplace"
arch=('x86_64')
url="https://alpha.biz/"
_githuburl="https://github.com/tanshuai/alphabiz"
license=('GPL2')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('expat' 'cairo' 'gdk-pixbuf2' 'pango' 'java-runtime' 'libxfixes' 'mesa' 'glibc' 'libx11' 'libxkbcommon' 'libxcb' 'gtk3' \
    'dbus' 'gcc-libs' 'libxrandr' 'nss' 'libdrm' 'libxext' 'at-spi2-core' 'glib2' 'libcups' 'libxdamage' 'nspr' 'alsa-lib' 'libxcomposite')
options=(!strip)
source=("${pkgname%-bin}-deb-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}.deb")
sha256sums=('9cbd61dae50d82a5fb3f0a813d28592e155a654bead4955f92e75253befce197')
    
package() {
    bsdtar -xf data.tar.zst -C "${pkgdir}"
    chmod 0755 "${pkgdir}/usr/lib/${pkgname%-bin}/chrome-sandbox"
}