# Maintainer: VintageTechie <https://vintagetechie.com>
pkgname=cosmic-updates-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Universal package update checker applet for COSMIC Desktop with AUR support (binary)"
arch=('x86_64')
url="https://github.com/VintageTechie/cosmic-updates"
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
source=("https://github.com/VintageTechie/cosmic-updates/releases/download/v${pkgver}/cosmic-updates-${pkgver}-x86_64.tar.gz")
sha256sums=('9d24f31d52e24ab6173b6fcbfa804a9be6e319fa0977fdb6a92bab43ba474cc9')

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
