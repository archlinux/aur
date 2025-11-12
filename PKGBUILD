# Maintainer: VintageTechie <https://vintagetechie.com>
pkgname=cosmic-updates-bin
pkgver=1.0.0
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
sha256sums=('8ec64193f96a7eefec8d3ecd1fd328ebde8ec2454d59b24c089ddcb2f8fa7f57')

package() {
    cd "$srcdir/cosmic-updates"
    
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
