# Maintainer: VintageTechie <https://vintagetechie.com>
pkgname=cosmic-updates-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Universal package update checker applet for COSMIC Desktop (binary)"
arch=('x86_64')
url="https://codeberg.org/VintageTechie/cosmic-updates"
license=('MIT')
depends=('cosmic-panel')
optdepends=(
    'pacman: For Arch-based package management'
    'checkupdates: For checking Pacman updates'
)
provides=('cosmic-updates')
conflicts=('cosmic-updates' 'cosmic-updates-git')
source=("https://codeberg.org/VintageTechie/cosmic-updates/releases/download/v${pkgver}/cosmic-updates-${pkgver}-x86_64.tar.gz")
sha256sums=('1e99c75c057f6337c8af60bb66925bea43932c41826ac13454e007b240f43dbf')

package() {
    cd "$srcdir"
    
    install -Dm755 "cosmic-updates" \
        "$pkgdir/usr/bin/cosmic-updates"
    
    install -Dm644 "com.vintagetechie.CosmicUpdates.desktop" \
        "$pkgdir/usr/share/applications/com.vintagetechie.CosmicUpdates.desktop"
    
    install -Dm644 "tux-normal.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/tux-normal.svg"
    install -Dm644 "tux-alert.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/tux-alert.svg"
}
