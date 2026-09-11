# Maintainer: Yuzuki <lxf74663@gmail.com>

pkgname=qqmusic-tui-bin
_pkgname=qqmusic-tui
pkgver=0.3.1
pkgrel=1
_upstream_pkgrel=1
pkgdesc="Linux terminal QQ Music player (.NET 10 Native AOT pre-built package)"
arch=('x86_64' 'aarch64')
url="https://github.com/Viemean/qmtui"
license=('MIT')
depends=(
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
    'gst-plugins-bad'
    'libpulse'
)
depends_x86_64=(
    'qemu-user'
)

optdepends=(
    'gst-libav: additional audio codecs (AAC/M4A) support'
    'wl-clipboard: Wayland clipboard support for copying song links'
    'xclip: X11 clipboard support for copying song links'
)

provides=('qmtui' 'qqmusic-tui')
conflicts=('qmtui' 'qqmusic-tui')

source_x86_64=("${pkgname}-upstream-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://github.com/Viemean/qmtui/releases/download/v${pkgver}/qmtui-bin-${pkgver}-${_upstream_pkgrel}-x86_64.pkg.tar.zst")
source_aarch64=("${pkgname}-upstream-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst::https://github.com/Viemean/qmtui/releases/download/v${pkgver}/qmtui-bin-${pkgver}-${_upstream_pkgrel}-aarch64.pkg.tar.zst")
sha256sums_x86_64=('9dcc0f18cec220293f3064dfca0c88cbf20577fb1b7e7a3bf04e86fa9860758b')
sha256sums_aarch64=('f42c33e306bebb703e393ca091de2a4c5083ccb1a68134f4308d545e83513b43')

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/"
}
