# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Laurent Meunier <laurent@deltalima.net>

pkgname=goocanvasmm
pkgver=1.90.6
pkgrel=1
pkgdesc='C++ wrappers for goocanvas'
arch=('i686' 'x86_64')
url='http://ftp.gnome.org/pub/gnome/sources/goocanvasmm/'
license=('GPL')
depends=('goocanvas' 'gtkmm3')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/goocanvasmm/1.90/goocanvasmm-${pkgver}.tar.xz)
sha256sums=('2d63cff0ea1a20cb0ebb9b91fbefe2a80f8972b1dbcda018ba4f10fbfda5c699')

build() {
  cd ${pkgname}-${pkgver}

  ./configure \
    --prefix=/usr \
    --disable-static \
    --disable-documentation

  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install
}
