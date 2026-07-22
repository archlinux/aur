# Maintainer: czyt <czytcn@gmail.com>
pkgname=docking-bin
pkgver=2.10.0
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
sha256sums_x86_64=('7f674868548105b040eb512297b14f7c3bb915e2a65f84e4d6a4b91367b438c3')
sha256sums_aarch64=('1da4dcd7651e71f41bcc7d9282d13eaba395c475695c20d92baa19cbc05b1174')

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
