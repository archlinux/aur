# Maintainer: Nicolas Chevalier <nickknight@netc.fr>
pkgname=tetrix
pkgver=0.1.0
pkgrel=1
pkgdesc="ASCII Tetris for the terminal with lock delay, mirror pieces, polyomino mode, and animated bomb physics"
arch=('any')
url="https://codeberg.org/nickknight/tetrix"
license=('MIT')
depends=('python')
makedepends=('make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2c2e4f940810a49666c71023707179263ce233c568f7eba7b5fda7b553c17df5')  # replaced by `updpkgsums` after each release

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
