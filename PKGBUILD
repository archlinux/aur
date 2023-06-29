# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="basic-blackjack-bin"
pkgver=0.2.9
pkgrel=1
pkgdesc="An overly-simplified version of the Blackjack card game"
arch=("x86_64")
url="https://github.com/devklick/basic-blackjack"
license=('custom')
depends=('nss' 'libxdamage' 'libxrandr' 'at-spi2-core' 'alsa-lib' 'libdrm' 'mesa' 'pango' 'libx11' 'libxcb' 'libcups' 'nspr' \
    'hicolor-icon-theme' 'dbus' 'gcc-libs' 'libxext' 'libxkbcommon' 'glib2' 'expat' 'gtk3' 'libxcomposite' 'cairo' 'glibc' 'libxfixes')
conflicts=("${pkgname%-bin}" "basic-blackjack")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/BasicBlackjack_v${pkgver}.deb")
sha256sums=('4b29dba34569f075506d11674c706af56bf9c5342e2cb49716c9a832fba84594')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/Basic Blackjack/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}