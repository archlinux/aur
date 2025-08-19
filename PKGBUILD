# Maintainer: therock
pkgname=the-house
pkgver=2.2.0
pkgrel=1
pkgdesc="A cursed command line casino suite. Russian roulette, blackjack, and more"
arch=('any')
url="https://github.com/therock444/the-house"
license=('MIT')
depends=('bash')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/therock444/the-house/archive/refs/tags/v$pkgver-$pkgrel.tar.gz")
sha256sums=('0faa37265762b561cfbe91861be6ae8ca843102fa82b5093eb6b961f28e64848')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-$pkgrel/the-house" "$pkgdir/usr/bin/the-house"
  install -d "$pkgdir/usr/lib/$pkgname/games"
  install -m755 "$srcdir/$pkgname-$pkgver-$pkgrel/games/"*.sh "$pkgdir/usr/lib/$pkgname/games/"
  install -Dm644 "$srcdir/$pkgname-$pkgver-$pkgrel/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

