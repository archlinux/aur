# Maintainer: Jamie Beardslee <beardsleejamie@gmail.com>

pkgname=aspell-eo
pkgver=2.1.20000225a
pkgrel=3
pkgdesc="Esperanto dictionary for aspell"
arch=('x86_64')
url="http://aspell.net/"
license=('GPL')
depends=('aspell')
source=("ftp://ftp.gnu.org/gnu/aspell/dict/eo/aspell6-eo-$pkgver-2.tar.bz2")
md5sums=('455719c49ffeb51b204767de6e1d9ef6')

build() {
  cd "$srcdir/aspell6-eo-$pkgver-2"
  ./configure
  make
}

package() {
  cd "$srcdir/aspell6-eo-$pkgver-2"
  make DESTDIR="$pkgdir" install

  install -D -m644 Copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
