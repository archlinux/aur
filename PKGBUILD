# Maintainer: Yuzuki <lxf74663@gmail.com>

pkgname=qqmusic-tui-bin
_pkgname=qqmusic-tui
pkgver=0.2.1
pkgrel=1
_upstream_pkgrel=1
pkgdesc="Linux terminal QQ Music player (.NET 10 Native AOT pre-built package)"
arch=('x86_64' 'aarch64')
url="https://github.com/Viemean/qqmusiclinux/tree/tui"
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

provides=('qqmusic-tui')
conflicts=('qqmusic-tui')

source_x86_64=("${pkgname}-upstream-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://github.com/Viemean/qqmusiclinux/releases/download/v${pkgver}/${pkgname}-${pkgver}-${_upstream_pkgrel}-x86_64.pkg.tar.zst")
source_aarch64=("${pkgname}-upstream-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst::https://github.com/Viemean/qqmusiclinux/releases/download/v${pkgver}/${pkgname}-${pkgver}-${_upstream_pkgrel}-aarch64.pkg.tar.zst")
sha256sums_x86_64=('9e685913862fe73be60d69eee58dc2dbb303a61abf4aa78f6ee434a6d3122ca1')
sha256sums_aarch64=('88c0355c832d3fbf759e216a9e7a710766d935cf37b31aa3af9f22e613988526')

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/"
}
