# Maintainer: therock
pkgname=the-house
pkgver=1.0.2
pkgrel=8
pkgdesc="A cursed command line casino suite. Russian roulette, blackjack, and more"
arch=('any')
url="https://github.com/therock444/the-house"
license=('MIT')
depends=('bash')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/therock444/the-house/archive/refs/tags/v$pkgver-$pkgrel.tar.gz")
sha256sums=('13c95df74470759dcfcbba1bda0ef009c8c6b5f7754f207761cb9630b65d18f6')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-$pkgrel/the-house" "$pkgdir/usr/bin/the-house"
  install -d "$pkgdir/usr/lib/$pkgname/games"
  install -m755 "$srcdir/$pkgname-$pkgver-$pkgrel/games/"*.sh "$pkgdir/usr/lib/$pkgname/games/"
  install -Dm644 "$srcdir/$pkgname-$pkgver-$pkgrel/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

