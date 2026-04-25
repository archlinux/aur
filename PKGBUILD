# Maintainer: Nicolas Chevalier <nickknight@netc.fr>
pkgname=tetrix
pkgver=0.1.1
pkgrel=1
pkgdesc="ASCII Tetris for the terminal with lock delay, mirror pieces, polyomino mode, and animated bomb physics"
arch=('any')
url="https://codeberg.org/nickknight/tetrix"
license=('MIT')
depends=('python')
makedepends=('make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7a2ac4dfca34653c18e18e0926fc7c04ca98162813d4df6aab200957943c389d')

build() {
    cd "$srcdir/$pkgname"
    make zipapp
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 tetrix  "$pkgdir/usr/bin/tetrix"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
