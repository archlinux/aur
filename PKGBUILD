# Maintainer: Severen Redwood <severen.redwood@gmail.com>
# Contributor: Robert Welin <robert.welin@gmail.com>
pkgname=gtkd
pkgver=3.1.3
pkgrel=1
pkgdesc="D binding and OO wrapper of GTK+"
arch=('i686' 'x86_64')
url="http://gtkd.org"
options=('staticlibs')
license=('LGPL')
depends=('gtk3')
makedepends=('dmd')
optdepends=('pango' 'atk' 'gdk-pixbuf2' 'gtksourceview3' 'gstreamer')
source=("http://gtkd.org/Downloads/sources/GtkD-${pkgver}.zip")
md5sums=('05e684105b4c25c35c6793e85b760973')

build() {
  cd ${srcdir}
  make gtkd
}

package() {
  cd ${srcdir}
  make prefix="/usr" DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
