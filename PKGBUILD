# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gdl
pkgver=2.30.1
pkgrel=1
pkgdesc="Gnome Devtool Libraries"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org/"
depends=('gtk2>=2.22.0')
makedepends=('pkgconfig' 'intltool')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/gdl/2.30/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('027dd1cd0191996fe1a0dc902da857698cc79564cb057ba13b09097e56e30cc1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static
  make
  make DESTDIR="${pkgdir}" install
}
