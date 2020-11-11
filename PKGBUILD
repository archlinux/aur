# Maintainer: Arnaud Berthomier <oz@cypr.io>

pkgname=monocypher
_pkgname=monocypher
pkgver=3.1.1
pkgrel=2
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
  install -d -m 755 "$pkgdir/usr/include/$pkgname"
  install -m 644 src/monocypher.c "$pkgdir/usr/include/$pkgname/monocypher.c"
  install -m 644 src/monocypher.h "$pkgdir/usr/include/$pkgname/monocypher.h"
  install -m 644 src/optional/monocypher-ed25519.h "$pkgdir/usr/include/$pkgname/monocypher-ed25519.h"
  install -m 644 src/optional/monocypher-ed25519.c "$pkgdir/usr/include/$pkgname/monocypher-ed25519.c"
  install -d -m 755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 LICENCE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d -m 755 "$pkgdir/usr/share/man/man3"
  install -m 644 doc/man/man3/*.3monocypher "$pkgdir/usr/share/man/man3/"
  install -m 644 doc/man/man3/optional/* "$pkgdir/usr/share/man/man3/"
  install -d -m 755 "$pkgdir/usr/lib/pkgconfig"
  install -m 644 monocypher.pc "$pkgdir/usr/lib/pkgconfig/"
}
