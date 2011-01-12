# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Laurent Meunier <laurent@deltalima.net>

pkgname=goocanvasmm
pkgver=0.15.4
pkgrel=1
pkgdesc='C++ wrappers for goocanvas'
arch=('i686' 'x86_64')
url='http://ftp.gnome.org/pub/gnome/sources/goocanvasmm/'
license=('GPL')
depends=('gegl' 'goocanvas' 'glibmm' 'gtkmm')
source=("http://ftp.gnome.org/pub/gnome/sources/goocanvasmm/${pkgver:0:4}/goocanvasmm-${pkgver}.tar.bz2")
md5sums=('cf462e8d2f36f4e02387eb094773b3e9')

build() {
  cd ${pkgname}-${pkgver}

  ./configure \
    --prefix=/usr \
    --disable-documentation

  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install
}
