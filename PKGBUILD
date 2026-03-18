# Maintainer: Hexa-Programmer
pkgname=hexamorse
pkgver=1.1
pkgrel=1
pkgdesc="Terminal-based Morse code typing tool with real-time cheatsheet"
arch=('x86_64' 'i686')
url="https://github.com/HexaProgrammer/HexaMorse"
license=('MIT')
depends=('python')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/HexaProgrammer/HexaMorse/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP') # replace with actual sha256sum after release

package() {
    cd "$srcdir/HexaMorse-$pkgver"
    install -Dm755 main.py "$pkgdir/usr/bin/hexamorse"
    install -Dm644 README.md "$pkgdir/usr/share/doc/hexamorse/README.md"
    # Optional: install assets if you have images/icons
    if [ -d "assets" ]; then
        cp -r assets "$pkgdir/usr/share/hexamorse/"
    fi
}