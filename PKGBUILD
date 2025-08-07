# Maintainer: therock
pkgname=the-house
pkgver=1.0.2
pkgrel=4
pkgdesc="A cursed command line casino suite. Russian roulette, blackjack, and more"
arch=('any')
url="https://github.com/therock444/the-house"
license=('MIT')
depends=('bash')
source=("https://github.com/therock444/the-house/archive/refs/tags/${pkgname}-v${pkgver}-${pkgrel}.tar.gz")
sha256sums=('01702f7ec3e724e85e6c603a06d9973bdc3eb2e1157f09095b91a3917f1407be')
prepare() {
mv "$srcdir/the-house-the-house-v$pkgver-$pkgrel" "$srcdir/$pkgname"
}

package() {
  install -Dm755 "$srcdir/$pkgname/the-house" "$pkgdir/usr/bin/the-house"
  install -d "$pkgdir/usr/lib/$pkgname/games"
  install -m755 "$srcdir/$pkgname/games/"*.sh "$pkgdir/usr/lib/$pkgname/games/"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

