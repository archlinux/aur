# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gdl
pkgver=2.30.0
pkgrel=1
pkgdesc="Gnome Devtool Libraries"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org/"
depends=('gtk2>=2.20.0')
makedepends=('pkgconfig' 'intltool')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/gdl/2.30/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('c3ca19831384ae8570f1e6fc0e6be9b2a5ba0f14592b9f2bbb629be113791453')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
