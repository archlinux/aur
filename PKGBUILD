# Maintainer: VintageTechie <https://vintagetechie.com>
pkgname=cosmic-updates-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Universal package update checker applet for COSMIC Desktop with AUR support (binary)"
arch=('x86_64')
url="https://codeberg.org/VintageTechie/cosmic-updates"
license=('MIT')
depends=('cosmic-panel')
optdepends=(
    'pacman: For Arch-based package management'
    'checkupdates: For checking Pacman updates'
    'paru: For AUR package support (preferred)'
    'yay: For AUR package support'
)
provides=('cosmic-updates')
conflicts=('cosmic-updates' 'cosmic-updates-git')
source=("https://codeberg.org/VintageTechie/cosmic-updates/releases/download/v${pkgver}/cosmic-updates-${pkgver}-x86_64.tar.gz")
sha256sums=('535229a5e503830701d5675a6ea317b1acb4affaa55c06144a7fdfe03cf99888')

package() {
    cd "$srcdir"
    
    # Install binary
    install -Dm755 "cosmic-updates" \
        "$pkgdir/usr/bin/cosmic-updates"
    
    # Install desktop file
    install -Dm644 "com.vintagetechie.CosmicUpdates.desktop" \
        "$pkgdir/usr/share/applications/com.vintagetechie.CosmicUpdates.desktop"
    
    # Install icons (they're in subdirectories in the tarball)
    install -Dm644 "icons/hicolor/scalable/apps/tux-normal.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/tux-normal.svg"
    install -Dm644 "icons/hicolor/scalable/apps/tux-alert.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/tux-alert.svg"
}
