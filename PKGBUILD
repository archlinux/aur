# Maintainer: Nguyen Hoang Ky <nhktmdzhg at gmail dot com>
_pkgname=zalo
pkgname=zalo-for-linux-bin
provides=(zalo)
conflicts=(zalo)
pkgver=26.11.10
_zadarkver=26.3
_commithash=784f24f
pkgrel=7
pkgdesc="Zalo for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/VN-Linux-Family/zalo-for-linux"
license=('BSD-3-Clause')
depends=(
    'glibc'
    'python'
    'opus'
    'libpulse'
    'alsa-utils'
    'pipewire'
    'rtkit'
)
optdepends=(
    'wl-clipboard: paste images from clipboard on Wayland'
    'xclip: paste images from clipboard on X11'
    'zenity: call window when the engine is run standalone'
)
source=(
    "zalo.desktop"
    "Zalo.png"
)
source_x86_64=("Zalo-${pkgver}+ZaDark-${_zadarkver}-${_commithash}.AppImage::https://github.com/VN-Linux-Family/zalo-for-linux/releases/download/${pkgver}/Zalo-${pkgver}+ZaDark-${_zadarkver}-${_commithash}-x86_64.AppImage")
source_aarch64=("Zalo-${pkgver}+ZaDark-${_zadarkver}-${_commithash}.AppImage::https://github.com/VN-Linux-Family/zalo-for-linux/releases/download/${pkgver}/Zalo-${pkgver}+ZaDark-${_zadarkver}-${_commithash}-aarch64.AppImage")
options=(!strip !debug)
sha256sums=(
    'b9478f6156fc65858971ca8fb0cc0b94d327ed34f704ce4c614b10e7510dbfe9'
    '54556414e921d2e72db65cdace024251c05e31ce2e1aa3db82aa330436815445'
)
sha256sums_x86_64=('4e4d32488161dbea7d6128844aaa7f2e8b5baa68d7a252347676f918e292364c')
sha256sums_aarch64=('2b5c46d29354cbe3172bb2da8660992b90ec88642312fc0471bdcf5aaa2f433c')

package() {
    install -Dm755 "${srcdir}/Zalo-${pkgver}+ZaDark-${_zadarkver}-${_commithash}.AppImage" "${pkgdir}/usr/bin/zalo"
    install -Dm644 "${srcdir}/zalo.desktop" "${pkgdir}/usr/share/applications/zalo.desktop"
    install -Dm644 "${srcdir}/Zalo.png" "${pkgdir}/opt/zalo/icon.png"
}
