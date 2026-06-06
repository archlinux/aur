# Maintainer: Nguyen Hoang Ky <nhktmdzhg at gmail dot com>
_pkgname=zalo
pkgname=zalo-for-linux-bin
provides=(zalo)
conflicts=(zalo)
pkgver=26.5.20
_zadarkver=26.2
_commithash=806dffa
pkgrel=1
pkgdesc="Zalo for Linux"
arch=('x86_64')
url="https://github.com/doandat943/zalo-for-linux"
license=('MIT')
depends=(
    'sqlite'
    'glibc'
    'zlib'
)
optdepends=(
    'wl-clipboard: paste images from clipboard on Wayland'
    'xclip: paste images from clipboard on X11'
)
source=(
    "zalo.AppImage::https://github.com/doandat943/zalo-for-linux/releases/download/${pkgver}/Zalo-${pkgver}+ZaDark-${_zadarkver}-${_commithash}.AppImage"
    "zalo.desktop"
    "Zalo.png"
    "zalo"
)
options=(!strip !debug)
sha256sums=(
    'f393d26688043e4012571579dab94260e299901b486a821e9869b913b68701b8'
    '3c54d9828c0e4b763226516ab1d7984c72777e70165983795f5d77c8db93fec9'
    '54556414e921d2e72db65cdace024251c05e31ce2e1aa3db82aa330436815445'
    'a14fe90cebf219764340d5297e87f3b982a3131d04a3561132b089e47cf6386d'
)
package() {
    install -Dm755 "${srcdir}/zalo.AppImage" "${pkgdir}/opt/zalo/zalo.AppImage"
    install -Dm755 "${srcdir}/zalo" "${pkgdir}/usr/bin/zalo"
    install -Dm644 "${srcdir}/zalo.desktop" "${pkgdir}/usr/share/applications/zalo.desktop"
    install -Dm644 "${srcdir}/Zalo.png" "${pkgdir}/opt/zalo/icon.png"
}
