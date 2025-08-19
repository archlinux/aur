# Maintainer: therock
pkgname=the-house
pkgver=2.2.0
pkgrel=2
pkgdesc="A cursed command line casino suite. Russian roulette, blackjack, and more"
arch=('any')
url="https://github.com/therock444/the-house"
license=('MIT')
depends=('bash')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/therock444/the-house/archive/refs/tags/v$pkgver-$pkgrel.tar.gz")
sha256sums=('1533944e3fb4311f9f995ff9b326452e525c541728d73f8886e3f985584a035e')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-$pkgrel/the-house" "$pkgdir/usr/bin/the-house"
  install -d "$pkgdir/usr/lib/$pkgname/games"
  install -m755 "$srcdir/$pkgname-$pkgver-$pkgrel/games/"*.sh "$pkgdir/usr/lib/$pkgname/games/"
  install -Dm644 "$srcdir/$pkgname-$pkgver-$pkgrel/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

