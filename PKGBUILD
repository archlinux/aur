# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gdl
pkgver=2.91.90
pkgrel=1
pkgdesc="Gnome Devtool Libraries"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org/"
depends=('gtk3')
makedepends=('pkgconfig' 'intltool' 'gobject-introspection')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/gdl/2.91/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('792575d0eeb8fd14820ab88bce708f16e68e6be584bbef61a1d42deb2c96d1e5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
