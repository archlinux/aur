# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=mount-gtk2
_pkgname=mount-gtk
pkgver=1.4.3
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
sha256sums=('6a245837c68214c133af96239aa772461074e57115a229ec695b2d5dbd9d2fe6')

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
