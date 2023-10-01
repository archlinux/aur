# Maintainer: Dan Johansen <strit@strits.dk>

pkgname=tui-sudoku
pkgver=0.3.0
pkgrel=1
pkgdesc="A configurable terminal interface sudoku game, written in Bash, with quite a few features"
arch=('any')
url="https://gitlab.com/christosangel/$pkgname"
license=('GPL2-or-later')
depends=('bash' 'qqwing' 'fzf' 'lolcat')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('339c817c5c034ee619c9048b339af220e47b9633fa1a6fd76f5fb9b4f0e005c7')

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r png/ "$pkgdir/usr/share/$pkgname/"
  install -Dm644 $pkgname.config "$pkgdir/etc/$pkgname.config"
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
}
