# Maintainer: Nguyen Hoang Ky <nhktmdzhg at gmail dot com>
_pkgname=zalo
pkgname=zalo-for-linux-bin
provides=(zalo)
conflicts=(zalo)
pkgver=26.10.20
_zadarkver=26.3
_commithash=267fda9
pkgrel=3
pkgdesc="Zalo for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/VN-Linux-Family/zalo-for-linux"
license=('MIT')
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
    'deepin-screen-recorder: Screenshot without/with Zalo window button'
    'spectacle: Screenshot without/with Zalo window button'
    'flameshot: Screenshot without/with Zalo window button'
    'gnome-screenshot: Screenshot without/with Zalo window button'
    'xfce4-screenshooter: Screenshot without/with Zalo window button'
    'mate-utils: Screenshot without/with Zalo window button'
    'cosmic-screenshot: Screenshot without/with Zalo window button'
    'scrot: Screenshot without/with Zalo window button'
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
sha256sums_x86_64=('6013e3623009b2c7bb3acee9c5f84b00ab7f8cb90a3ff353381ccec90ebb9e1b')
sha256sums_aarch64=('d6ed935de1ebb6a3bbeffc0a7c4488b945a037cbd5a70e0faa51a85320d13ac2')

package() {
    install -Dm755 "${srcdir}/Zalo-${pkgver}+ZaDark-${_zadarkver}-${_commithash}.AppImage" "${pkgdir}/usr/bin/zalo"
    install -Dm644 "${srcdir}/zalo.desktop" "${pkgdir}/usr/share/applications/zalo.desktop"
    install -Dm644 "${srcdir}/Zalo.png" "${pkgdir}/opt/zalo/icon.png"
}
