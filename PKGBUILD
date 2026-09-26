# Maintainer: Nguyen Hoang Ky <nhktmdzhg at gmail dot com>
_pkgname=zalo
pkgname=zalo-for-linux-bin
provides=(zalo)
conflicts=(zalo)
pkgver=26.9.10
_zadarkver=26.2.1
_commithash=4ea0762
pkgrel=5
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
    'mate-screenshot: Screenshot without/with Zalo window button'
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
source_x86_64=("zalo.AppImage::https://github.com/VN-Linux-Family/zalo-for-linux/releases/download/${pkgver}/Zalo-${pkgver}+ZaDark-${_zadarkver}-${_commithash}-x86_64.AppImage")
source_aarch64=("zalo.AppImage::https://github.com/VN-Linux-Family/zalo-for-linux/releases/download/${pkgver}/Zalo-${pkgver}+ZaDark-${_zadarkver}-${_commithash}-aarch64.AppImage")
options=(!strip !debug)
sha256sums=(
    'b9478f6156fc65858971ca8fb0cc0b94d327ed34f704ce4c614b10e7510dbfe9'
    '54556414e921d2e72db65cdace024251c05e31ce2e1aa3db82aa330436815445'
)
sha256sums_x86_64=('c08ab471db045e7278f3b6c22ad156a36e7bd595e5f42ec3e997e148d72a8679')
sha256sums_aarch64=('e07097a10257ae46c5f40295eac5eb7e6d95d91d29f09cc32deb3baf3a80e6db')

package() {
    install -Dm755 "${srcdir}/zalo.AppImage" "${pkgdir}/usr/bin/zalo"
    install -Dm644 "${srcdir}/zalo.desktop" "${pkgdir}/usr/share/applications/zalo.desktop"
    install -Dm644 "${srcdir}/Zalo.png" "${pkgdir}/opt/zalo/icon.png"
}
