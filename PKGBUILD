# $Id: PKGBUILD,v 1.14 2007/08/19 11:57:37 jgc Exp $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gdl
pkgver=0.7.7
pkgrel=1
pkgdesc="Gnome Devtool Libraries"
arch=(i686 x86_64)
license=('GPL')
depends=('libgnomeui>=2.18.1-2')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/gdl/0.7/${pkgname}-${pkgver}.tar.bz2)
md5sums=('c3b676b174c3e6c4ccd654557ebe82ec')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
