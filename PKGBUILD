# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libgdata
pkgver=0.6.5
pkgrel=1
pkgdesc="GLib-based library for accessing online service APIs using the GData protocol"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libsoup-gnome>=2.32.0')
makedepends=('pkgconfig' 'intltool' 'gobject-introspection')
url="http://www.gnome.org"
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/0.6/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('dcb82f7162d69549512444376da2cdea65650ee4dae4d00eed7fbbd3387ddf2c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static
  make
  make DESTDIR="${pkgdir}" install
}
