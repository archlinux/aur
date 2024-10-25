# Maintainer: Arnaud Berthomier <oz@cypr.io>

pkgname=monocypher
_pkgname=monocypher
pkgver=4.0.2
pkgrel=1
pkgdesc="Monocypher is an easy to use crypto library inspired by libsodium and TweetNaCl"
arch=('i686' 'x86_64' 'aarch64')
url="https://monocypher.org/"
license=('custom:BSD')
depends=('glibc')
source=("https://monocypher.org/download/monocypher-${pkgver}.tar.gz")
sha256sums=('38d07179738c0c90677dba3ceb7a7b8496bcfea758ba1a53e803fed30ae0879c')
sha512sums=('bf275d4c53ff94af6cdc723a4e002e9f080f4d1436c86c76bb37870b34807f1d7b32331d8ff8a1aeb369e946f3769021e03e63efac25b82efc5abf54dc084714')

package() {
  cd "$_pkgname-$pkgver"
  make install PREFIX=usr DESTDIR="$pkgdir"
  make install-doc PREFIX=usr DESTDIR="$pkgdir"

  install -d -m 755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 LICENCE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
