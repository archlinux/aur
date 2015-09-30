# Maintainer: Severen Redwood <severen.redwood@gmail.com>
# Contributor: Robert Welin <robert.welin@gmail.com>
pkgname=gtkd
pkgver=3.1.4
pkgrel=1
pkgdesc="A D binding and OO wrapper of GTK+"
arch=('i686' 'x86_64')
url="http://gtkd.org"
options=('staticlibs')
license=('LGPL')
depends=('gtk3')
makedepends=('dmd')
optdepends=('pango' 'atk' 'gdk-pixbuf2' 'gtksourceview3' 'gstreamer')
source=("http://gtkd.org/Downloads/sources/GtkD-${pkgver}.zip")
md5sums=('e0897c4e12bb5f9fac6986c2131e2d86')

build() {
  cd ${srcdir}
  make gtkd
}

package() {
  cd ${srcdir}
  make prefix='/usr' DESTDIR="${pkgdir}/" install
}
