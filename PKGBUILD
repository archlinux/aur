# Maintainer: VintageTechie <https://vintagetechie.com>
pkgname=cosmic-ext-applet-updates-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="Updates Applet for COSMIC Desktop (community extension) - precompiled binary"
arch=('x86_64')
url="https://github.com/VintageTechie/cosmic-ext-applet-updates"
license=('MIT')
depends=('cosmic-panel' 'pacman-contrib')
optdepends=(
    'paru: For AUR support (preferred)'
    'yay: For AUR support (alternative)'
)
provides=('cosmic-ext-applet-updates')
conflicts=('cosmic-ext-applet-updates' 'cosmic-ext-applet-updates-git')
source=("https://github.com/VintageTechie/cosmic-ext-applet-updates/releases/download/v${pkgver}/cosmic-ext-applet-updates-${pkgver}-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir"
    
    install -Dm755 "cosmic-ext-applet-updates" \
        "$pkgdir/usr/bin/cosmic-ext-applet-updates"
    
    install -Dm644 "com.vintagetechie.CosmicExtAppletUpdates.desktop" \
        "$pkgdir/usr/share/applications/com.vintagetechie.CosmicExtAppletUpdates.desktop"
    
    install -Dm644 "icons/hicolor/scalable/apps/tux-normal.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/tux-normal.svg"
    install -Dm644 "icons/hicolor/scalable/apps/tux-alert.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/tux-alert.svg"
    
    install -Dm644 "LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
