# Maintainer: therock
pkgname=the-house
pkgver=1.0.2
pkgrel=2
pkgdesc="A cursed command line casino suite. Russian roulette, blackjack, and more"
arch=('any')
url="https://github.com/therock444/the-house"
license=('MIT')
depends=('bash')
source=("https://github.com/therock444/the-house/archive/refs/tags/${pkgname}-v${pkgver}-${pkgrel}.tar.gz")
sha256sums=('ab8b0e12e03988ea2a4bf31a7973409c736492fbe547109653f93785fa98f37c')
prepare() {
mv "$srcdir/the-house-the-house-v$pkgver-$pkgrel" "$srcdir/$pkgname"
}

package() {
  install -Dm755 "$srcdir/$pkgname/the-house" "$pkgdir/usr/bin/the-house"
  install -d "$pkgdir/usr/lib/$pkgname/games"
  install -m755 "$srcdir/$pkgname/games/"*.sh "$pkgdir/usr/lib/$pkgname/games/"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

