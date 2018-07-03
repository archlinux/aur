# Maintainer: Kamalavelan aka demonshreder <sskamalavelan@gmail.com>

pkgname=monocypher
_pkgname=monocypher
pkgver=2.0.4
pkgrel=1
pkgdesc="Monocypher is an easy to use crypto library inspired by libsodium and TweetNaCl"
arch=('i686' 'x86_64')
url="http://loup-vaillant.fr/projects/monocypher/"
license=('custom:BSD')
depends=('glibc')
source=("https://monocypher.org/download/monocypher-${pkgver}.tar.gz")
sha512sums=('b58ffbd6ea67fb3cad57fa16dada957b2944972f109065e189462b54379c577357bac587ade5792b6c34040af6b2f2ce638534e53871783c5249c8bfd996cc81')

package() {
  cd "$_pkgname-$pkgver"
  install -d -m 755 "$pkgdir/usr/include/$pkgname"
  install -m 644 src/monocypher.c "$pkgdir/usr/include/$pkgname/monocypher.c"
  install -m 644 src/monocypher.h "$pkgdir/usr/include/$pkgname/monocypher.h"
  install -m 644 src/optional/sha512.h "$pkgdir/usr/include/$pkgname/sha512.h"
  install -m 644 src/optional/sha512.c "$pkgdir/usr/include/$pkgname/sha512.c"
  install -d -m 755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 LICENCE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d -m 755 "$pkgdir/usr/share/man/man3"
  install -m 644 doc/man/man3/* "$pkgdir/usr/share/man/man3/"
  }
