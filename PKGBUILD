# Maintainer: Kamalavelan aka demonshreder <sskamalavelan@gmail.com>

pkgname=monocypher
_pkgname=monocypher
pkgver=2.0.5
pkgrel=1
pkgdesc="Monocypher is an easy to use crypto library inspired by libsodium and TweetNaCl"
arch=('i686' 'x86_64')
url="http://loup-vaillant.fr/projects/monocypher/"
license=('custom:BSD')
depends=('glibc')
source=("https://monocypher.org/download/monocypher-${pkgver}.tar.gz")
sha256sums=('4fc0496ee89c5a1f00e9fd4a87051137561cdbb6f1aeafd1cbf11a87288bca5b')
sha512sums=('634dfaa981decb48043161f733702f7b55c1057bbb4cd8c202c8d8c1dd6fadcfbce881328f5df95213931eeea160d74330d18992d83fd60c76390e53023078f9')

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
