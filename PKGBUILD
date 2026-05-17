# Maintainer: giswqs <giswqs at gmail dot com>

pkgname=virtual-screen-bin
_pkgname=virtual-screen
pkgver=0.3.0
pkgrel=1
pkgdesc="Use any browser as a second-screen client for KDE Linux"
arch=('x86_64')
url="https://github.com/opengeos/virtual-screen"
license=('MIT')
depends=(
  'gtk3'
  'hicolor-icon-theme'
  'webkit2gtk-4.1'
)
optdepends=(
  'gstreamer: GStreamer command-line tools for capture and streaming'
  'gst-plugins-bad: WebRTC and PipeWire GStreamer elements'
  'gst-plugins-good: X11, JPEG, VP8, and multipart GStreamer elements'
  'gst-plugin-pipewire: PipeWire capture support for Wayland sessions'
  'gst-plugins-ugly: H.264 encoding support through x264enc'
  'iproute2: local network address detection'
  'libxcvt: cvt command for X11 virtual display modes'
  'xorg-xrandr: X11 output detection and virtual display setup'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source=(
  'virtual-screen.desktop'
  "${_pkgname}-512.png::${url}/raw/v${pkgver}/src-tauri/icons/icon.png"
  "${_pkgname}-128.png::${url}/raw/v${pkgver}/src-tauri/icons/128x128.png"
  "${_pkgname}-32.png::${url}/raw/v${pkgver}/src-tauri/icons/32x32.png"
)
source_x86_64=("${_pkgname}::${url}/releases/download/v${pkgver}/virtual-screen_linux_x64")
sha256sums=(
  'dffa2d19617bbaa95bc52365edf681774587b4918a3818de6cc66349397138ec'
  '53d602d5895381cc705633662d012a6440abfe7fe90698cf3529b36d4b1da8e1'
  'b4ec51e826decc076ec0456c55a793211767a1d7f961c6e3d333768af8582d38'
  '68c28dac195a47963b3ec1f032d5f7cc641a9a46febcbe393c8698ec221b580f'
)
sha256sums_x86_64=('1291d3114b8f55969073beb0e413d7e12507cce44d803e7bc2dafc85c11c9984')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/virtual-screen.desktop" \
    "${pkgdir}/usr/share/applications/virtual-screen.desktop"
  install -Dm644 "${srcdir}/${_pkgname}-512.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
  install -Dm644 "${srcdir}/${_pkgname}-128.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
  install -Dm644 "${srcdir}/${_pkgname}-32.png" \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
}
