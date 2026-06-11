# Maintainer: Miran Kljun <miran.kljun@gmail.com>
pkgname=rclone-wiz
pkgver=1.5
pkgrel=5
pkgdesc="A simple and easy to use tool to configure, script, and mount cloud drives using rclone"
arch=('any')
url="https://github.com/themix88/Clone-WIZ"
license=('GPL3')

depends=(
    'python'
    'python-pyqt6'
    'rclone'
    'fuse3' 
)

optdepends=(
    'konsole: Supported terminal for rclone config'
    'alacritty: Supported terminal for rclone config'
    'gnome-terminal: Supported terminal for rclone config'
    'xterm: Supported terminal for rclone config'
)

# We include the .desktop file and VERSION in the source array so makepkg finds them
source=("rclone-wiz.py" "rclone-wiz.desktop" "rclone-wiz.svg" "LICENSE" "VERSION" "README.md")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    # 1. Install the executable
    install -Dm755 "$srcdir/rclone-wiz.py" "$pkgdir/usr/bin/rclone-wiz"
    
    # 2. Install the desktop file
    install -Dm644 "$srcdir/rclone-wiz.desktop" "$pkgdir/usr/share/applications/rclone-wiz.desktop"

    # 3. Install the icon to a standard directory
    install -Dm644 "$srcdir/rclone-wiz.svg" "$pkgdir/usr/share/pixmaps/rclone-wiz.svg"

    # 4. Copy license file GPL3
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # 5. Put VERSION file to the application's shared data directory
    install -Dm644 "$srcdir/VERSION" "$pkgdir/usr/share/$pkgname/VERSION"

    # 6. Put README file to the application's shared data directory
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/$pkgname/README.md"
}