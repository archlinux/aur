# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gdl
pkgver=2.28.1
pkgrel=1
pkgdesc="Gnome Devtool Libraries"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org/"
depends=('gtk2>=2.18.2')
makedepends=('pkgconfig' 'intltool')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/gdl/2.28/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('f856ea09ac79f909c45111543ac0928a2a95174873de1a919533ede46aa3aff1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
