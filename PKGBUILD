# Maintainer: Jamie Beardslee <beardsleejamie@gmail.com>

pkgname=aspell-eo
pkgver=2.1.20000225a
pkgrel=1
pkgdesc="Esperanto dictionary for aspell"
arch=('x86_64')
url="http://aspell.net/"
license=('GPL')
depends=('aspell')
source=("ftp://ftp.gnu.org/gnu/aspell/dict/eo/aspell6-eo-$pkgver-1.tar.bz2")
md5sums=('5b944cd470a1bde3b647d34e4d8749bc')

build() {
  cd "$srcdir/aspell6-eo-$pkgver-1"
  ./configure
  make
}

package() {
  cd "$srcdir/aspell6-eo-$pkgver-1"
  make DESTDIR="$pkgdir" install

  install -D -m644 Copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
