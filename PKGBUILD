# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="basic-blackjack-bin"
pkgver=0.2.6
pkgrel=1
pkgdesc="An overly-simplified version of the Blackjack card game"
arch=("x86_64")
url="https://github.com/devklick/basic-blackjack"
license=('custom')
depends=('nss' 'libxdamage' 'libxrandr' 'at-spi2-core' 'alsa-lib' 'libdrm' 'mesa' 'pango' 'libx11' 'libxcb' 'libcups' 'nspr' \
    'hicolor-icon-theme' 'dbus' 'gcc-libs' 'libxext' 'libxkbcommon' 'glib2' 'expat' 'gtk3' 'libxcomposite' 'cairo' 'glibc' 'libxfixes')
conflicts=("${pkgname%-bin}" "basic-blackjack")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/BasicBlackjack_v${pkgver}.deb")
sha256sums=('ce40a68774a91ed7eb30f92b4d5500eb93f757fffad84687eb9510cc00fb0942')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/Basic Blackjack/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}