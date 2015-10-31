# Maintainer: Lex Black <autumn-wind at web dot de>

pkgname=libscrypt
pkgver=1.21
pkgrel=1
pkgdesc="shared library that implements scrypt() functionality - a replacement for bcrypt()"
arch=(i686 x86_64)
license=('BSD')
url="https://github.com/technion/libscrypt"
source=($pkgname-$pkgver.tar.gz::https://github.com/technion/$pkgname/archive/v${pkgver}.tar.gz)
sha1sums=('eb75c5c75094055c3e9a5b90da5a3e37fc1b5e20')


build() {
  cd $pkgname-$pkgver

  make
}

check() {
  cd $pkgname-$pkgver

  make check
}

package() {
  cd $pkgname-$pkgver

  make PREFIX=/usr DESTDIR=$pkgdir install
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
