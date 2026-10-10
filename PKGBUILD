# Maintainer: Nguyen Hoang Ky <nhktmdzhg at gmail dot com>
_pkgname=zalo
pkgname=zalo-for-linux-bin
provides=(zalo)
conflicts=(zalo)
pkgver=26.10.10
_zadarkver=26.2.1
_commithash=e80931a
pkgrel=4
pkgdesc="Zalo for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/VN-Linux-Family/zalo-for-linux"
license=('MIT')
depends=(
    'sqlite'
    'glibc'
    'zlib'
)
optdepends=(
    # Clipboard & Screenshots
    'wl-clipboard: paste images from clipboard on Wayland'
    'xclip: paste images from clipboard on X11'
    'deepin-screen-recorder: Screenshot without/with Zalo window button'
    'spectacle: Screenshot without/with Zalo window button'
    'flameshot: Screenshot without/with Zalo window button'
    'gnome-screenshot: Screenshot without/with Zalo window button'
    'xfce4-screenshooter: Screenshot without/with Zalo window button'
    'mate-utils: Screenshot without/with Zalo window button'
    'scrot: Screenshot without/with Zalo window button'

    # Audio/Video Calling (ZCall Bridge)
    'wine: Voice/Video call engine support (or download portable wine in-app)'
    'v4l-utils: control camera formats (fix inverted/green camera)'
    'V4L2LOOPBACK-MODULE: loopback camera support'

    # Wayland Screen Sharing Bridge
    'xorg-server-xvfb: headless X server for Wayland screen-sharing bridge'
    'xdotool: window resizing for screen bridge display'
    'gst-plugins-base: 64-bit GStreamer plugins (ximagesink) for screen bridge'
    'gst-plugins-bad: 64-bit GStreamer plugins (pipewiresrc) for screen bridge'
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
sha256sums_x86_64=('99b5eab7dbe5100b9e7c4aafb2f003514fbc0f08d3e779fb9451a0ba77d33fa7')
sha256sums_aarch64=('cbe97443d1171b87db8c5ba0fa0302a4a0843cd03dab29ed1ba1dbafcd1bb43b')

package() {
    install -Dm755 "${srcdir}/Zalo-${pkgver}+ZaDark-${_zadarkver}-${_commithash}.AppImage" "${pkgdir}/usr/bin/zalo"
    install -Dm644 "${srcdir}/zalo.desktop" "${pkgdir}/usr/share/applications/zalo.desktop"
    install -Dm644 "${srcdir}/Zalo.png" "${pkgdir}/opt/zalo/icon.png"
}
