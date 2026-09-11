# Maintainer: Yuzuki <lxf74663@gmail.com>

pkgname=qqmusic-tui-bin
_pkgname=qqmusic-tui
pkgver=0.3.2
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
sha256sums_x86_64=('89ecb6e94dae4fe0fd35c1641e503385f4b9918e6136415631a3fd89ddc0de73')
sha256sums_aarch64=('e121155875511bc8571103bdbfccd185d005591cadb9b6336077c7073dc4aa2d')

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/"
}
