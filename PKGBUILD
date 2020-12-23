# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>

pkgname=lockdev-redirect
pkgver=1.0.0
pkgrel=1
pkgdesc="Tool for redirecting /var/lock to a user-writable directory"
url="https://www.github.com/M-Reimer/lockdev-redirect"
arch=('x86_64')
license=('LGPL3')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/M-Reimer/lockdev-redirect/archive/$pkgver.tar.gz")
sha256sums=('b15665d07ff811785fa2e94064c71881c7b6502d93ac9a5c018e5c250c015365')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}
