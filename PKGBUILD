# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=gtk2_prefs
pkgver=0.4.1
pkgrel=5
pkgdesc="A GTK2 theme selector and font switcher"
arch=('x86_64' 'i686')
url="http://gtk-win.sourceforge.net/home/index.php/en/Gtk2Prefs"
license=("GPL")
depends=('gtk2')
source=(http://downloads.sourceforge.net/gtk-win/gtk2_prefs-$pkgver.tar.bz2)
md5sums=('873d2a7707e1dcadc861399434d98d86')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  sed -i '1,1i#include <string.h>' src/main.cpp
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
