# Maintainer: Severen Redwood <severen@shrike.me>
# Contributor: Robert Welin <robert.welin@gmail.com>
# Report all package issues to `https://github.com/SShrike/pkgbuilds`

pkgname=gtkd
pkgver=3.2.2
pkgrel=1
pkgdesc="D bindings for GTK+"
arch=('i686' 'x86_64')
url="http://gtkd.org"
options=('staticlibs')
license=('LGPL')
depends=('gtk3')
makedepends=('dmd')
optdepends=('pango' 'atk' 'gdk-pixbuf2' 'gtksourceview3' 'gstreamer')
source=("http://gtkd.org/Downloads/sources/GtkD-${pkgver}.zip")
md5sums=('2940d5f0b52f6388db8d4a4cca11a73a')

build() {
  cd ${srcdir}
  make gtkd
}

package() {
  cd ${srcdir}
  make prefix='/usr' DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
