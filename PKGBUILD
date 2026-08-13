# Maintainer: VisiGrid <hello@visigrid.app>
pkgname=visigrid-bin
pkgver=0.28.0
pkgrel=1
pkgdesc="Fast, native spreadsheet with GPU-accelerated rendering"
arch=('x86_64')
url="https://visigrid.app"
license=('AGPL-3.0-only')
depends=('gtk3' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'wayland')
provides=('visigrid')
conflicts=('visigrid' 'visigrid-git')
source=("VisiGrid-${pkgver}-linux-x86_64.tar.gz::https://github.com/VisiGrid/VisiGrid/releases/download/v${pkgver}/VisiGrid-linux-x86_64.tar.gz")
sha256sums=('58ad18330357016d00242602079e6ae04f28c6e8fc2911f65d1ebf7175a3c522')

package() {
    cd "$srcdir/VisiGrid-linux-x86_64"

    # Install binaries
    install -Dm755 visigrid "$pkgdir/usr/bin/visigrid"
    install -Dm755 vgrid "$pkgdir/usr/bin/vgrid"

    # Install desktop file
    install -Dm644 visigrid.desktop "$pkgdir/usr/share/applications/visigrid.desktop"

    # Install icon
    install -Dm644 visigrid.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/visigrid.png"
}
