# Maintainer: Arnaud Berthomier <oz@cypr.io>

pkgname=monocypher
_pkgname=monocypher
pkgver=3.1.3
pkgrel=1
pkgdesc="Monocypher is an easy to use crypto library inspired by libsodium and TweetNaCl"
arch=('i686' 'x86_64')
url="https://monocypher.org/"
license=('custom:BSD')
depends=('glibc')
source=("https://monocypher.org/download/monocypher-${pkgver}.tar.gz")
sha256sums=('b442b577df28f8c36caa01d9ae9011b5dd9c717d94be520168a04e36d7f5016e')
sha512sums=('c55d6253c36087b336fc8054b716b5f9c3a5e83c4fb0c07e0945b1b6d37fc815857896417c66466ae7f2cb3e5aed01bcef115aff67cd694e78b1ec0dcc713581')

package() {
  cd "$_pkgname-$pkgver"
  make install USE_ED25519=true PREFIX=usr DESTDIR="$pkgdir"
  make install-doc USE_ED25519=true PREFIX=usr DESTDIR="$pkgdir"

  install -d -m 755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 LICENCE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
