# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gdl
pkgver=2.91.92
pkgrel=1
pkgdesc="Gnome Devtool Libraries"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org/"
depends=('gtk3')
makedepends=('pkgconfig' 'intltool' 'gobject-introspection')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/gdl/2.91/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('aba74b97ac0013babff4acda3eb662a86c372a6a1b76e5ade95126b18e740be6')

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
