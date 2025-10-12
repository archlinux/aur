# Maintainer: Max Berggren <maxberggren@gmail.com>
pkgname=jotite
pkgver=2.0.1
pkgrel=1
pkgdesc="A lightweight, fun, distraction-free markdown note-taking app with live markdown rendering"
arch=('any')
url="https://github.com/maxberggren/omarchy-jotite"
license=('MIT')
depends=('gjs' 'gtk4' 'libadwaita' 'fontconfig')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bf51111980ceb7adc5a6391e78943209e478292caedf57fc6d653d0dddbdf7dd')

package() {
    cd "$srcdir/omarchy-jotite-$pkgver"

    # Install the main script
    install -Dm755 jotite.js "$pkgdir/usr/bin/jotite"

    # Install desktop file (if you have one)
    install -Dm644 jotite.desktop "$pkgdir/usr/share/applications/jotite.desktop"

    # Install icon (if you have one)
    install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/jotite.png"
}