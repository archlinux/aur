# Maintainer: Dan Johansen <strit@strits.dk>

pkgname=tui-mines
pkgver=0.1.0
pkgrel=3
pkgdesc="A text-based user interface implimentation of the classic  mine sweeping puzzle game"
arch=('any')
url="https://gitlab.com/christosangel/$pkgname"
license=('GPL-2.0-or-later')
depends=(
        'bash'
        'ttf-font-nerd'
)
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "tui-mines.config")
sha256sums=('7b429cf1bb4f3841c36ce6165d173de7e68bcbd815d59d2182b1b00934c66338'
            '704f043a23775095972eb76e4cb4fe3b552831ae96bf918ffa08466c1c83336f')

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  install -Dm644 $pkgname.png "$pkgdir/usr/share/$pkgname/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.config" "$pkgdir/etc/$pkgname.config"
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
}
