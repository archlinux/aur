# Maintainer: therock
pkgname=the-house
pkgver=1.0.2
pkgrel=3
pkgdesc="A cursed command line casino suite. Russian roulette, blackjack, and more"
arch=('any')
url="https://github.com/therock444/the-house"
license=('MIT')
depends=('bash')
source=("https://github.com/therock444/the-house/archive/refs/tags/${pkgname}-v${pkgver}-${pkgrel}.tar.gz")
sha256sums=('7118263f75fb2b9c1f8dae26497144e8c51a0bda09f6235d6ede12d257c16b9b')
prepare() {
mv "$srcdir/the-house-the-house-v$pkgver-$pkgrel" "$srcdir/$pkgname"
}

package() {
  install -Dm755 "$srcdir/$pkgname/the-house" "$pkgdir/usr/bin/the-house"
  install -d "$pkgdir/usr/lib/$pkgname/games"
  install -m755 "$srcdir/$pkgname/games/"*.sh "$pkgdir/usr/lib/$pkgname/games/"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

