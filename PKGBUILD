# Maintainer: Bjarne Øverli <bjarne.oeverli@gmail.com>
pkgname=jot-git
pkgver=1.1.0
pkgrel=1
pkgdesc="A single-purpose tool for capturing a thought before it disappears"
arch=('any')
url="https://github.com/bjarneo/omarchy-jot"
license=('MIT')
depends=('gjs' 'gtk4' 'libadwaita')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6fa312adb5907d87a10dd6feefbfb351909b1855d80211dc6db0aaa4fd7c589a')

package() {
    cd "$srcdir/omarchy-jot-$pkgver"

    # Install the main script
    install -Dm755 jot.js "$pkgdir/usr/bin/jot"

    # Install the icon
    install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/jot.png"

    # Install the desktop file
    install -Dm644 jot.desktop "$pkgdir/usr/share/applications/jot.desktop"
}
