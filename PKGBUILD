# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=mount-gtk2
_pkgname=mount-gtk
pkgver=1.4.0
pkgrel=1
pkgdesc="A graphical front end for udisks and mount (compiled for Gtk2)"
arch=('i686' 'x86_64')
url="http://mount-gtk.sourceforge.net"
license=('GPL')
provides=($_pkgname=$pkgver)
replaces=($_pkgname)
conflicts=($_pkgname)
depends=('c++-gtk-utils-gtk2' 'gtk2' 'udisks2>=1.94.0')
optdepends=('libnotify: error notifications')
options=('!buildflags')
source=(http://downloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('a63ea5c1b5659bacd91094a50ee33b04097af28f810cc3a78d140bfbc0b81eee')

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
