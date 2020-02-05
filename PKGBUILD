# Maintainer: Arnaud Berthomier <oz@cypr.io>

pkgname=monocypher
_pkgname=monocypher
pkgver=3.0.0
pkgrel=1
pkgdesc="Monocypher is an easy to use crypto library inspired by libsodium and TweetNaCl"
arch=('i686' 'x86_64')
url="https://monocypher.org/"
license=('custom:BSD')
depends=('glibc')
source=("https://monocypher.org/download/monocypher-${pkgver}.tar.gz")
sha256sums=('6604b837b99bc68c6c18ee5d8960ad24f404707a09418bf4c5dc8d493cb71afd')
sha512sums=('dfb260d080a3f710ab70b108b2e69d2fc0d18f9427584bb44c2009e87cb4c1a942df980a5f2ddfcf5b3f1e0c074ddde764da22b3516acc41ac812dbf22aae50d')

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
}
