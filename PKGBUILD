# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=wiggle
pkgver=1.1
pkgrel=1
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
md5sums=('0a76d5ed008094da05ac15abe89c1641')
sha1sums=('e54338c2955677263c3075013099d0b9c573498f')
sha256sums=('3da3cf6a456dd1415d2644e345f9831eb2912c6fa8dfa5d63d9bf49d744abff3')
