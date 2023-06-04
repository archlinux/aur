# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="alphabiz-bin"
pkgver=0.2.5
pkgrel=1
pkgdesc="Web3 ecosystem - enable developers to build fully decentralized media platform and blockchain-based marketplace"
arch=('x86_64')
url="https://alpha.biz/"
_githuburl="https://github.com/tanshuai/alphabiz"
license=('GPL2')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('expat' 'cairo' 'wayland' 'pango' 'java-runtime' 'libxfixes' 'mesa' 'glibc' 'libx11' 'libxkbcommon' 'libxcb' 'gtk3' \
    'dbus' 'gcc-libs' 'libxrandr' 'nss' 'libdrm' 'libxext' 'at-spi2-core' 'glib2' 'libcups' 'libxdamage' 'nspr' 'alsa-lib' 'libxcomposite')
source=("${pkgname%-bin}-deb-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}.deb")
sha256sums=('4d43ff14132e4a4fe0ac4d0b432a682b9da096075cb7264cb5194f435b0c7374')
    
package() {
    bsdtar -xf data.tar.zst -C "${pkgdir}"
    chmod 0755 "${pkgdir}/usr/lib/${pkgname%-bin}/chrome-sandbox"
}