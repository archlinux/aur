# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gdl
pkgver=3.0.0
pkgrel=1
pkgdesc="GNOME Docking Library"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org/"
depends=('gtk3')
makedepends=('pkgconfig' 'intltool' 'gobject-introspection')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('2b84b1ff4d798920ff04ba1f89f2e20468d706d9f4aab19d03241f32b16bec96')

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
