# Maintainer: uwiwiow <uwiwiow@gmail.com>

pkgname="sudoku-simple"
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple sudoku game made with raylib, features auto-annotations"
arch=('x86_64')
url="https://github.com/uwiwiow/${pkgname}"
license=('MIT')

options=(!debug)

depends=()

source=("$pkgname-$pkgver-$CARCH.tar.gz::https://github.com/uwiwiow/$pkgname/releases/download/$pkgver/$pkgname-$pkgver-$CARCH.tar.gz"
    "$pkgname.desktop")


sha256sums=(41cdb6e8c8b2cdd6bc46e037755bb31c066da2ce4bf225103f28651ce790e99e
    9b840c25ee736a0132d84c66dd08d083aee6de65fc64bb2458b8ecaab184b564)

package() {
    cd "$srcdir/Sudoku-simple"

    install -Dm755 sudoku-simple "$pkgdir/usr/bin/sudoku-simple"

    install -dm755 "$pkgdir/usr/share/$pkgname/assets"
    cp -r assets/* "$pkgdir/usr/share/$pkgname/assets/"

		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"


    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
