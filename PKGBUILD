# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=wiggle
pkgver=1.0
pkgrel=2
pkgdesc="A program for applying patches that patch cannot apply because of conflicting changes"
arch=('i686' 'x86_64')
depends=('ncurses')
url="https://github.com/neilbrown/wiggle"
license=('GPL2')
source=(http://neil.brown.name/wiggle/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # Building with -Wall -Werror fails. Respect CFLAGS from /etc/makepkg.conf
  sed -i -r 's/^CFLAGS=.*/CFLAGS+=-I. /' Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
md5sums=('777d8d4c718220063511e82e16275d1b')
sha1sums=('07fa4450c658d3f24d2e529b7fc4d883b5ba2e51')
sha256sums=('44c97b2d47a109c709cdd4181d9ba941fee50dbb64448018b91d4a2fffe69cf2')
