# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=gnet
pkgver=2.0.8
pkgrel=6
pkgdesc="A simple network library"
arch=('x86_64')
url="https://wiki.gnome.org/Projects/GNetLibrary"
license=('LGPL')
depends=('glib2' 'libnsl')
source=("https://download.gnome.org/sources/gnet/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('14034c7ef571a93f2aca21b2280fa86b35ef5730541d3eb57557dd42d7cc506b')

build() {
  cd ${pkgname}-${pkgver}
  LIBS+="-lglib-2.0" ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
