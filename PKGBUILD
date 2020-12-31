# Maintainer: Arnaud Berthomier <oz@cypr.io>

pkgname=monocypher
_pkgname=monocypher
pkgver=3.1.2
pkgrel=1
pkgdesc="Monocypher is an easy to use crypto library inspired by libsodium and TweetNaCl"
arch=('i686' 'x86_64')
url="https://monocypher.org/"
license=('custom:BSD')
depends=('glibc')
source=("https://monocypher.org/download/monocypher-${pkgver}.tar.gz")
sha256sums=('f80a2e16d553e4b119634fd0e85ff86fc42afb4c9cc4569077854d1b6f5ef4f9')
sha512sums=('7b94a78abcd5490891cb7c5f29fe269d426fe12d99986ed0ec20246d2d5274e190d5f738e8c32bb9de2a21a7f9960460ac617eb320e28cd53a574c629547b767')

package() {
  cd "$_pkgname-$pkgver"
  make install USE_ED25519=true PREFIX=usr DESTDIR="$pkgdir"
  make install-doc USE_ED25519=true PREFIX=usr DESTDIR="$pkgdir"

  install -d -m 755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 LICENCE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
