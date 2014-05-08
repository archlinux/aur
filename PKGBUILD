# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=mount-gtk2
_pkgname=mount-gtk
pkgver=1.4.2
pkgrel=1
pkgdesc="A graphical front end for udisks and mount (compiled for Gtk2)"
arch=('i686' 'x86_64')
url="http://mount-gtk.sourceforge.net/"
license=('GPL')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
depends=('c++-gtk-utils-gtk2' 'udisks2>=1.94.0' 'libnotify')
options=('!buildflags')
source=(http://downloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('755a4aae98c8c14c909dfc8da2e46f32ce720137edecdb3d8fcdc99fa02dbd03')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr --with-gtk-version=gtk2
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
