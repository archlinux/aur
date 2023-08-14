# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=alphabiz-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Web3 ecosystem - enable developers to build fully decentralized media platform and blockchain-based marketplace"
arch=('x86_64')
url="https://alpha.biz/"
_githuburl="https://github.com/tanshuai/alphabiz"
license=('GPL2')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('expat' 'cairo' 'wayland' 'pango' 'java-runtime' 'libxfixes' 'mesa' 'glibc' 'libx11' 'libxkbcommon' 'libxcb' 'gtk3' \
    'dbus' 'gcc-libs' 'libxrandr' 'nss' 'libdrm' 'libxext' 'at-spi2-core' 'glib2' 'libcups' 'libxdamage' 'nspr' 'alsa-lib' 'libxcomposite')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}.deb")
sha256sums=('cabecbc4a60c836440e67c365e272d15391b5bb09a277d632bc1310c3ac06289')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
    chmod 0755 "${pkgdir}/usr/lib/${pkgname%-bin}/chrome-sandbox"
}