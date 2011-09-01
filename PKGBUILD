# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=clutter-gtk
pkgver=1.0.2
pkgrel=1
pkgdesc="GTK clutter widget"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('clutter' 'gtk3')
makedepends=('gobject-introspection' 'gtk-doc')
source=(http://www.clutter-project.org/sources/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('044e46b4b36e71bd05f677639bbc5f8c6debd655e2ce69a8d937ed1b4e79d192')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
