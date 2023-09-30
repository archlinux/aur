# Maintainer: Dan Johansen <strit@strits.dk>

pkgname=tui-sudoku
pkgver=0.2.1
pkgrel=1
pkgdesc="A configurable terminal interface sudoku game, written in Bash, with quite a few features"
arch=('any')
url="https://gitlab.com/christosangel/$pkgname"
license=('GPL2-or-later')
depends=('bash' 'qqwing' 'fzf' 'lolcat')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ec4d678e95446bf52dbd6eba7ed607f91e964f6d143509fdd609e963331f547d')

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r png/ "$pkgdir/usr/share/$pkgname/"
  install -Dm644 $pkgname.config "$pkgdir/etc/$pkgname.config"
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
}
