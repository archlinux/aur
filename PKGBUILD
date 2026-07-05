# Maintainer: czyt <czytcn@gmail.com>
pkgname=docking-bin
pkgver=2.4.1
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
sha256sums_x86_64=('bdbf092caf8cdcf4cc191e6924e39bd0a778e5fe4c9e0b32af6dc842e450c139')
sha256sums_aarch64=('dcdeefcff355682632382ad757305b92d4b08f6b6f9915e6aeb58eb5d6679d01')

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
