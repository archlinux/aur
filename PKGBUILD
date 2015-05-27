# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: anonymous_user <31337h4ck3r at gmail dot com>
# Contributor: Christoph Zeiler <rabyteNOSPAM_at_gmx.dot.org>

pkgname=mount-gtk2
_pkgname=mount-gtk
pkgver=1.4.3
pkgrel=2
pkgdesc="A graphical front end for udisks and mount (compiled for Gtk2)"
arch=('i686' 'x86_64')
url="http://mount-gtk.sourceforge.net/"
license=('GPL')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
makedepends=()
depends=('c++-gtk-utils-gtk2' 'udisks2' 'libnotify')
options=('!buildflags')
source=(http://downloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('6a245837c68214c133af96239aa772461074e57115a229ec695b2d5dbd9d2fe6')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr --with-gtk-version=gtk2
  make V=0
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
