# Maintainer: Nguyen Hoang Ky <nhktmdzhg at gmail dot com>
_pkgname=zalo
pkgname=zalo-for-linux-bin
provides=(zalo)
conflicts=(zalo)
pkgver=26.6.10
_zadarkver=26.2
_commithash=806dffa
pkgrel=2
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
)
options=(!strip !debug)
sha256sums=(
    '3ceaf0fa7cd3c9d1c8cfc6c9d0259da7bf3c6f6d1914c62bdad442a4a328574e'
    'b9478f6156fc65858971ca8fb0cc0b94d327ed34f704ce4c614b10e7510dbfe9'
    '54556414e921d2e72db65cdace024251c05e31ce2e1aa3db82aa330436815445'
)
package() {
    install -Dm755 "${srcdir}/zalo.AppImage" "${pkgdir}/usr/bin/zalo"
    install -Dm644 "${srcdir}/zalo.desktop" "${pkgdir}/usr/share/applications/zalo.desktop"
    install -Dm644 "${srcdir}/Zalo.png" "${pkgdir}/opt/zalo/icon.png"
}
