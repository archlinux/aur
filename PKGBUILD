# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=mount-gtk2
_pkgname=mount-gtk
pkgver=1.4.1
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
sha256sums=('ee43b7515011bf589e2e8c55b3a4478658539acfa9b47171fcc792b6cfe25bab')

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
