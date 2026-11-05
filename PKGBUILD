# Maintainer: czyt <czytcn@gmail.com>
pkgname=docking-bin
pkgver=2.28.3
pkgrel=1
pkgdesc="A lightweight, feature-rich dock for Linux written in Python with GTK 3 and Cairo"
arch=('x86_64' 'aarch64')
url="https://github.com/edumucelli/docking"
license=('GPL3')
provides=('docking')
conflicts=('docking')
depends=(
    'python'
    'python-gobject'
    'python-cairo'
    'gtk3'
    'libwnck3'
    'networkmanager'
    'gstreamer'
    'librsvg'
    'hicolor-icon-theme'
    'adwaita-icon-theme'
)
source_x86_64=("docking-${pkgver}-x86_64.pkg.tar.zst::https://github.com/edumucelli/docking/releases/download/v${pkgver}/docking-${pkgver}-linux-x86_64.pkg.tar.zst")
source_aarch64=("docking-${pkgver}-aarch64.pkg.tar.xz::https://github.com/edumucelli/docking/releases/download/v${pkgver}/docking-${pkgver}-linux-aarch64.pkg.tar.xz")
sha256sums_x86_64=('41c7e7dc89aea45d1b64873f26451b42fb9b13c85e6431275f334a02bace6dee')
sha256sums_aarch64=('8f4e3b10dacc461b9cbf54ff621ea8ccdf4d84df0a7c351e3ad5463e6e512ea7')

package() {
    # Extract the prebuilt Arch package directly
    if [ "$CARCH" = "x86_64" ]; then
        bsdtar -xf "$srcdir/docking-${pkgver}-x86_64.pkg.tar.zst" \
            -C "$pkgdir" \
            --exclude='.PKGINFO' \
            --exclude='.MTREE' \
            --exclude='.BUILDINFO'
    elif [ "$CARCH" = "aarch64" ]; then
        bsdtar -xf "$srcdir/docking-${pkgver}-aarch64.pkg.tar.xz" \
            -C "$pkgdir" \
            --exclude='.PKGINFO' \
            --exclude='.MTREE' \
            --exclude='.BUILDINFO'
    fi
}
