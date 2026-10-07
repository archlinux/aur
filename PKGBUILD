# Maintainer: Nguyen Hoang Ky <nhktmdzhg at gmail dot com>
_pkgname=zalo
pkgname=zalo-for-linux-bin
provides=(zalo)
conflicts=(zalo)
pkgver=26.10.10
_zadarkver=26.2.1
_commithash=5ccd049
pkgrel=3
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
sha256sums_x86_64=('888879e02cf2cd3c7c0f98fa8c63d12216a132d842822ed216ee414adbcefc08')
sha256sums_aarch64=('af53048cce5cb70c6564b2b0b753a6743c7c513d3c6caf8c462676f9b2d3aa79')

package() {
    install -Dm755 "${srcdir}/Zalo-${pkgver}+ZaDark-${_zadarkver}-${_commithash}.AppImage" "${pkgdir}/usr/bin/zalo"
    install -Dm644 "${srcdir}/zalo.desktop" "${pkgdir}/usr/share/applications/zalo.desktop"
    install -Dm644 "${srcdir}/Zalo.png" "${pkgdir}/opt/zalo/icon.png"
}
