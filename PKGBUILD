# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=solar-wallet-bin
pkgver=0.28.1
pkgrel=1
pkgdesc="Stellar wallet. Secure and user-friendly."
arch=('x86_64')
url="https://solarwallet.io/"
_githuburl="https://github.com/satoshipay/solar"
license=('MIT')
depends=('glibc' 'gtk3' 'libxcb' 'python' 'libxkbcommon' 'nss' 'libcups' 'dbus' 'nspr' 'libxcomposite' 'libx11' \
    'lib32-gcc-libs' 'libxext' 'expat' 'libxfixes' 'libdrm' 'gcc-libs' 'hicolor-icon-theme' 'libxrandr' 'glib2' \
    'sh' 'libxdamage' 'pango' 'mesa' 'lib32-glibc' 'alsa-lib' 'at-spi2-core' 'nodejs' 'cairo' 'gdk-pixbuf2')
conflicts=("${pkgname%-bin}" "solarwallet" "solarwallet-appimage")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/Solar-Wallet-${pkgver}.deb"
    "LICENSE::https://raw.githubusercontent.com/satoshipay/solar/master/LICENSE")
sha256sums=('bbf429ba5faf083f602f087970bf6cfddc0178b743432f588d7d2c90764997b3'
            '122419a299dfabb6da3af79d00ffafba42ae185fa757be14cd5140f35c8ce094')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}