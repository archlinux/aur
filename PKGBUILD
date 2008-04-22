# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gdl
pkgver=0.7.11
pkgrel=1
pkgdesc="Gnome Devtool Libraries"
arch=(i686 x86_64)
license=('GPL')
depends=('libgnomeui>=2.22.01-1')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/gdl/0.7/${pkgname}-${pkgver}.tar.bz2)
md5sums=('74f529cc2623376ee793be65439f54d6')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
