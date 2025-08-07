# Maintainer: therock
pkgname=the-house
pkgver=1.0.1
pkgrel=8
pkgdesc="A cursed command line casino suite. Russian roulette, blackjack, and more"
arch=('any')
url="https://github.com/therock444/the-house"
license=('MIT')
depends=('bash')
source=("https://github.com/therock444/the-house/archive/refs/tags/${pkgname}-v${pkgver}-${pkgrel}.tar.gz")
sha256sums=('81396cc89cfca39d18c2d8599e7bca5562965aecf97a78bf1be8d71af0d99eef')
prepare() {
mv "$srcdir/the-house-the-house-v$pkgver-$pkgrel" "$srcdir/$pkgname"
}

package() {
  install -Dm755 "$srcdir/$pkgname/the-house" "$pkgdir/usr/bin/the-house"
  install -d "$pkgdir/usr/lib/$pkgname/games"
  install -m755 "$srcdir/$pkgname/games/"*.sh "$pkgdir/usr/lib/$pkgname/games/"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

