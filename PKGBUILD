# Maintainer: Dan Johansen <strit@strits.dk>

pkgname=tui-sudoku
pkgver=0.5.2
pkgrel=1
pkgdesc="A configurable terminal interface sudoku game, written in Bash, with quite a few features"
arch=('any')
url="https://gitlab.com/christosangel/$pkgname"
license=('GPL2-or-later')
depends=('bash' 'qqwing' 'lolcat')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a1cb7be17f8c383ef0792af84d7a06cefa8859d0782498ff0044751d78cba3e8')

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r png/ "$pkgdir/usr/share/$pkgname/"
  install -Dm644 $pkgname.config "$pkgdir/etc/$pkgname.config"
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
}
