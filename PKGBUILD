# Maintainer: Severen Redwood <severen.redwood@gmail.com>
# Contributors: TingPing <tingping@tingping.se>
#               Diego Cano <elkano@blep.org>
pkgname=gtkd-git
pkgver=1199.98f9dc8
pkgrel=3
pkgdesc='D binding and OO wrapper of GTK+'
url='http://gtkd.org'
options=('staticlibs')
license=('LGPL')
arch=('i686' 'x86_64')
provides=('gtkd')
conflicts=('gtkd')
depends=('gtk3')
makedepends=('dmd')
optdepends=('pango' 'atk' 'gdk-pixbuf2' 'gtksourceview3' 'gstreamer')
source=('git://github.com/gtkd-developers/GtkD.git')
md5sums=('SKIP')

pkgver() {
  cd GtkD
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd GtkD
  make gtkd
}

package() {
  cd GtkD
  make prefix="/usr" DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
