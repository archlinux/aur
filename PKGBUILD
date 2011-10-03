# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gdl
pkgver=3.2.0
pkgrel=1
pkgdesc="GNOME Docking Library"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org/"
depends=('gtk3')
makedepends=('gtk-doc' 'intltool' 'gobject-introspection')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('f4839224b7837efb8fbec8666f8a3bb1ce9ea110f06c57a8b9438faa0abab533')

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
