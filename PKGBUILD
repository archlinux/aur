# Maintainer: phil-gru <goldencat@tutamail.com>                                     
pkgname=pearpass-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="PearPass is a distributed password manager powered by Pear Runtime. It allows secure storage of passwords, credit card details, and secure notes, with peer-to-peer syncing and end-to-end encryption."
arch=('x86_64')
url="https://pass.pears.com/"
license=('custom')
depends=('webkitgtk-6.0')
options=(!strip !debug)
provides=('pearpass')
_appimage="PearPass-Desktop-Linux-x64-v${pkgver}.AppImage"
source=(
    "PearPass-Desktop-Linux-x64-v${pkgver}.AppImage::https://github.com/tetherto/pearpass-app-desktop/releases/download/v${pkgver}/PearPass-Desktop-Linux-x64-v${pkgver}.AppImage"
    "pearpass.desktop"
    "pearpass.png"
    )
noextract=("${_appimage}")
sha256sums=('f5b610be1d3ffa5d11a0db032fd5598923c73c0802a8e1ffaa9cf93e913ac1bd'
            'f8c3f747b72779e0c287a43fe91bf2b80019d5f25b2d919ed9c35352b1fde2c2'
            '7a4cffe7da360a2212f85b16e07d3c65a7ee4a0d130c27ee99db7c90eed245a4')

package() {
    install -Dm755 $_appimage "$pkgdir"/usr/bin/pearpass
    chmod +x "${pkgdir}/usr/bin/pearpass"

    install -Dm644 "pearpass.desktop"                    "${pkgdir}/usr/share/applications/pearpass.desktop"
    install -Dm644 "pearpass.png"                        "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/pearpass.png"
}
