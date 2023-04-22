# Maintainer: Liuhaoyu <liuhaoyu62@126.com>
pkgname=passwdqc
pkgver=2.0.2
pkgrel=1
pkgdesc="pwqcheck (password strength checker) and pwqgen (random passphrase generator) from passwdqc"
arch=('any')
url="http://www.openwall.com/passwdqc/"
license=('BSD' 'custom:BSD Revised')
source=(http://www.openwall.com/passwdqc/$pkgname-$pkgver.tar.gz)
md5sums=('b9789cf265c9867f34654e2a683ad057')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"

  make SHARED_LIBDIR="/usr/lib" SECUREDIR="/usr/lib/security" DESTDIR="$pkgdir/" install
}
