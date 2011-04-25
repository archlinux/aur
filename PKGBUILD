# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gdl
pkgver=3.0.1
pkgrel=1
pkgdesc="GNOME Docking Library"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org/"
depends=('gtk3')
makedepends=('pkgconfig' 'intltool' 'gobject-introspection')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('e0c3d855c7f8b115ec10f34db1291cb09db48a24281c3f9242d8348b189d5b09')

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
