# Maintainer: Arnaud Berthomier <oz@cypr.io>

pkgname=monocypher
_pkgname=monocypher
pkgver=3.1.1
pkgrel=3
pkgdesc="Monocypher is an easy to use crypto library inspired by libsodium and TweetNaCl"
arch=('i686' 'x86_64')
url="https://monocypher.org/"
license=('custom:BSD')
depends=('glibc')
source=("https://monocypher.org/download/monocypher-${pkgver}.tar.gz")
sha256sums=('ed96874acfe75781cfbe06b049868920f0e9f493ec78e7d6e3879177a8d0af7a')
sha512sums=('9c202ffe74eac1f2a7f21b8e195d981c21c5792b788315dea168cf40f1ee83cb787f3409c2d6135f517a58fee5f3e44c9ef521e132cee40c04e4b4868787f366')

package() {
  cd "$_pkgname-$pkgver"
  make install USE_ED25519=true PREFIX=usr DESTDIR="$pkgdir"
  make install-doc USE_ED25519=true PREFIX=usr DESTDIR="$pkgdir"

  install -d -m 755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 LICENCE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
