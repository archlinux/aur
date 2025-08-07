# Maintainer: therock
pkgname=the-house
pkgver=1.0.1
pkgrel=7
pkgdesc="A cursed command line casino suite. Russian roulette, blackjack, and more"
arch=('any')
url="https://github.com/therock444/the-house"
license=('MIT')
depends=('bash')
source=("https://github.com/therock444/the-house/archive/refs/tags/${pkgname}-v${pkgver}-${pkgrel}.tar.gz")
sha256sums=('2d45f24d22edcf1d4f60571c886a54a00f8bce7630cef4d4dec58a1c242450fd')
prepare() {
mv "$srcdir/the-house-the-house-v$pkgver-$pkgrel" "$srcdir/$pkgname"
}

package() {
  install -Dm755 "$srcdir/$pkgname/the-house" "$pkgdir/usr/bin/the-house"
  install -d "$pkgdir/usr/lib/$pkgname/games"
  install -m755 "$srcdir/$pkgname/games/"*.sh "$pkgdir/usr/lib/$pkgname/games/"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

