# Maintainer: Yuzuki <lxf74663@gmail.com>

pkgname=qqmusic-tui-bin
_pkgname=qqmusic-tui
pkgver=0.1.9
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
sha256sums_x86_64=('3041b4ec840f814f9609819dcd8b6afc4e83c8e4877ceea9f9284c99179ba8a4')
sha256sums_aarch64=('ae63c5c4f47768aa44f2a69c6cf669e5822b66af9ea127dc24f0810890311f9a')

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/"
}
