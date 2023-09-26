# Maintainer: Dan Johansen <strit@strits.dk>

pkgname=tui-sudoku
pkgver=0.0.0.1
pkgrel=1
pkgdesc="A configurable terminal interface sudoku game, written in Bash, with quite a few features"
arch=('any')
url="https://gitlab.com/christosangel/$pkgname"
license=('GPL2-or-later')
depends=('bash' 'qqwing' 'fzf' 'lolcat')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/main/$pkgname-main.tar.gz")
sha256sums=('36b1d734c4166277a52adafdb3d25831af71f4a26bd225379e8f40c95a88932c')

package() {
  cd "$pkgname-main"
  mkdir -p "$pkgdir/usr/share/tui-sudoku"
  cp -r png/ "$pkgdir/usr/share/tui-sudoku/"
  install -Dm644 tui-sudoku.config "$pkgdir/etc/tui-sudoku.config"
  install -Dm755 tui-sudoku.sh "$pkgdir/usr/bin/tui-sudoku"
}
