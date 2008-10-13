# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gdl
pkgver=2.24.0
pkgrel=1
pkgdesc="Gnome Devtool Libraries"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org/"
depends=('libglade>=2.6.3')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/gdl/2.24/${pkgname}-${pkgver}.tar.bz2)
md5sums=('1d5cd4af1f4041394169d643316646bf')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
