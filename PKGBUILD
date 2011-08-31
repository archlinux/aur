# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libgdata
pkgver=0.10.0
pkgrel=1
pkgdesc="GLib-based library for accessing online service APIs using the GData protocol"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libsoup-gnome' 'liboauth')
makedepends=('pkgconfig' 'intltool' 'gobject-introspection')
url="http://www.gnome.org"
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('af4805304763b93058773bbfdb06925189159196066207f275cb34b1b5c552ec')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
