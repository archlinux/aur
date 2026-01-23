# Maintainer: VisiGrid <hello@visigrid.app>
pkgname=visigrid-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="Fast, native spreadsheet with GPU-accelerated rendering"
arch=('x86_64')
url="https://visigrid.app"
license=('MIT')
depends=('gtk3' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'wayland')
provides=('visigrid')
conflicts=('visigrid' 'visigrid-git')
source=("https://github.com/VisiGrid/VisiGrid/releases/download/v${pkgver}/VisiGrid-linux-x86_64.tar.gz")
sha256sums=('8012f3b5061f63290765395c13e12f6bce2c612a725b81107cba0603d8566586')

package() {
    cd "$srcdir/VisiGrid-linux-x86_64"

    # Install binaries
    install -Dm755 visigrid "$pkgdir/usr/bin/visigrid"
    install -Dm755 visigrid-cli "$pkgdir/usr/bin/visigrid-cli"

    # Install desktop file
    install -Dm644 visigrid.desktop "$pkgdir/usr/share/applications/visigrid.desktop"

    # Install icon
    install -Dm644 visigrid.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/visigrid.png"
}
