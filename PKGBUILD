# Maintainer: Charles Sneedworth <sneedworth@sevensevenseven.net>
pkgname=clocking-in
pkgver=0.0.4
pkgrel=1
pkgdesc="Fast-paced Puzzle-Clicker Game about disarming a timebomb."
arch=('x86_64')
url="https://github.com/sneedragon/jam-game"
license=('None')
depends=()  # No dependencies, since it's a standalone binary
makedepends=('git')  # Add build dependencies if necessary, e.g., for packaging tools

# URL to the game files hosted on GitHub
source=("https://github.com/sneedragon/jam-game/releases/download/0.0.4/timebomb.x86_64"
        "https://github.com/sneedragon/jam-game/releases/download/0.0.4/clocking_in.png"
        "https://github.com/sneedragon/jam-game/releases/download/0.0.4/clocking-in.desktop")
sha256sums=('6dbf1dcde3fbdcf115595022b211bedb6dfe98642f9ed950c476076db37b2deb'  # Binary checksum
            'e3c21ad126be2b891b2bdb545dd0a70e9e87dd34fc0569a9ceacd57dfefa0a92'  # Icon checksum
            'SKIP')  # Skip checksum for the .desktop file

# The package() function
package() {
    # Install the binary to a system directory, e.g., /usr/games
    install -Dm755 "$srcdir/timebomb.x86_64" "$pkgdir/usr/games/clocking-in"

    # Install the icon (use 256x256 as the standard size)
    install -Dm644 "$srcdir/clocking_in.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/clocking-in.png"

    # Install the desktop entry
    install -Dm644 "$srcdir/clocking-in.desktop" "$pkgdir/usr/share/applications/clocking-in.desktop"
