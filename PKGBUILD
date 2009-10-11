# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gdl
pkgver=2.28.0
pkgrel=1
pkgdesc="Gnome Devtool Libraries"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org/"
depends=('gtk2>=2.18.0')
makedepends=('pkgconfig' 'intltool')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/gdl/2.28/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('bcb6c5ac12c73c97d3e865bd8477456be7c4b1459c43af53010d3f1867c3e48e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
