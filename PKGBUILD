# Maintainer: Yuzuki <lxf74663@gmail.com>

pkgname=qqmusic-tui-bin
_pkgname=qqmusic-tui
pkgver=0.1.3
pkgrel=1
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

source_x86_64=("${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://github.com/Viemean/qqmusiclinux/releases/download/v${pkgver}/${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
source_aarch64=("${pkgname}-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst::https://github.com/Viemean/qqmusiclinux/releases/download/v${pkgver}/${pkgname}-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst")
sha256sums_x86_64=('a512fb3e18f57eac0c5feddfd1f0dd368c51404a3c4d48ebf8ae31aa0a4f4982')
sha256sums_aarch64=('e48df7d1305c7da872897ba0eb2f6f43d3d34a7c8a29a287bf21117b894bae02')

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/"
}
