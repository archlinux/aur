# Maintainer: czyt <czytcn@gmail.com>
pkgname=docking-bin
pkgver=2.35.0
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
sha256sums_x86_64=('eb234b42cff3b07ce1a12858c339aa799bd3567079508bf7f9c142a75aff482a')
sha256sums_aarch64=('272bc04fa226372e82841a842cf58334d8c409b01cbef06464e0d693f983def5')

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
