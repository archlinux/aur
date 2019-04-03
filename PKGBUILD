# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=gnet
pkgver=2.0.8
pkgrel=5
pkgdesc="A simple network library"
arch=('x86_64')
url="http://live.gnome.org/GNetLibrary"
license=('LGPL')
depends=('glib2' 'libnsl')
source=(http://ftp.gnome.org/pub/GNOME/sources/gnet/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('74a33dd25cc594b874e3a5171795efd99e567387')

build() {
  cd ${pkgname}-${pkgver}
  LIBS+="-lglib-2.0" ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
