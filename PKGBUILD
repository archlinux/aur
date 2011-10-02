# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Laurent Meunier <laurent@deltalima.net>

pkgname=goocanvasmm
pkgver=1.90.5
pkgrel=1
pkgdesc='C++ wrappers for goocanvas'
arch=('i686' 'x86_64')
url='http://ftp.gnome.org/pub/gnome/sources/goocanvasmm/'
license=('GPL')
depends=('goocanvas' 'gtkmm3')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/goocanvasmm/1.90/goocanvasmm-${pkgver}.tar.xz)
sha256sums=('9648e6fc6c41fceea348571b7db4421748bab7fbd7799700245890b63ae1b4b6')

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
