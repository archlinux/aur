# Maintainer: Dan Johansen <strit@strits.dk>

pkgname=tui-sudoku
pkgver=1.0.0
pkgrel=3
pkgdesc="A configurable terminal interface sudoku game, written in Bash, with quite a few features"
arch=('any')
url="https://gitlab.com/christosangel/$pkgname"
license=('GPL-2.0-or-later')
depends=(
        'bash'
        'qqwing'
        'lolcat'
)
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "tui-sudoku.config")
sha256sums=('8b08fabe7e13d550c7918c36eaafbe733d16908ea0119bf25c03e172cee2f44f'
            '284662a9743585e06400c6e3d89134402a674134e15ba7f108f0b02dc7f62c09')


package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r png/ "$pkgdir/usr/share/$pkgname/"
  install -Dm644 "$srcdir/$pkgname.config" "$pkgdir/etc/$pkgname.config"
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
}
