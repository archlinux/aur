# Maintainer: Bjarne Øverli <bjarne.oeverli@gmail.com>
pkgname=jot-git
pkgver=1.0.1
pkgrel=1
pkgdesc="A single-purpose tool for capturing a thought before it disappears"
arch=('any')
url="https://github.com/bjarneo/omarchy-jot"
license=('MIT')
depends=('gjs' 'gtk4' 'libadwaita')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1dc782f382be8afa65767aff68685bcdab1ed3bfbeac5c6ab07fdb9deef58216')

package() {
    cd "$srcdir/omarchy-jot-$pkgver"

    # Install the main script
    install -Dm755 jot.js "$pkgdir/usr/bin/jot"

    # Install the icon
    install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/jot.png"

    # Install the desktop file
    install -Dm644 jot.desktop "$pkgdir/usr/share/applications/jot.desktop"
}
