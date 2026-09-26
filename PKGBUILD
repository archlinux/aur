# Maintainer: Nguyen Hoang Ky <nhktmdzhg at gmail dot com>
_pkgname=zalo
pkgname=zalo-for-linux-bin
provides=(zalo)
conflicts=(zalo)
pkgver=26.9.10
_zadarkver=26.2.1
_commithash=cd53689
pkgrel=6
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
sha256sums_x86_64=('c34bdd04ec4bae2e35441d210f58eea438d26da4533f10ae20e1329dee34d8ee')
sha256sums_aarch64=('af54641d271f34935da9434911136146c9fa86fd49ece50ddaa878cfe3f3254d')

package() {
    install -Dm755 "${srcdir}/zalo.AppImage" "${pkgdir}/usr/bin/zalo"
    install -Dm644 "${srcdir}/zalo.desktop" "${pkgdir}/usr/share/applications/zalo.desktop"
    install -Dm644 "${srcdir}/Zalo.png" "${pkgdir}/opt/zalo/icon.png"
}
