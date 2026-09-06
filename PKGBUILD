# Maintainer: Yuzuki <lxf74663@gmail.com>

pkgname=qqmusic-tui-bin
_pkgname=qqmusic-tui
pkgver=0.1.5
pkgrel=2
_upstream_pkgrel=1
pkgdesc="Linux terminal QQ Music player (.NET 10 Native AOT pre-built package)"
arch=('x86_64' 'aarch64')
url="https://github.com/Viemean/qqmusiclinux/tree/tui"
license=('MIT')
depends=(
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
)
optdepends=(
    'ffmpeg: cover art extraction and display, audio recording'
    'imagemagick: rounded corner cover rendering in modern terminals'
    'gst-libav: additional audio codecs (AAC/M4A) support'
    'wl-clipboard: Wayland clipboard support for copying song links'
    'xclip: X11 clipboard support for copying song links'
)
provides=('qqmusic-tui')
conflicts=('qqmusic-tui')

source_x86_64=("${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://github.com/Viemean/qqmusiclinux/releases/download/v${pkgver}/${pkgname}-${pkgver}-${_upstream_pkgrel}-x86_64.pkg.tar.zst")
source_aarch64=("${pkgname}-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst::https://github.com/Viemean/qqmusiclinux/releases/download/v${pkgver}/${pkgname}-${pkgver}-${_upstream_pkgrel}-aarch64.pkg.tar.zst")
sha256sums_x86_64=('8c97260c4f9ec1e375ef28628cda641deff4519d33b678a1c938cb4311f18910')
sha256sums_aarch64=('4ee977dcdfa8d7a02936349c4efa724fabcdbf3fb015eed70e50c41ab2d8a1df')

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/"
}
