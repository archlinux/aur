# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Laurent Meunier <laurent@deltalima.net>

pkgname=goocanvasmm
pkgver=1.90.8
pkgrel=1
pkgdesc='C++ wrappers for goocanvas'
arch=('i686' 'x86_64')
url='http://ftp.gnome.org/pub/gnome/sources/goocanvasmm/'
license=('GPL')
depends=('goocanvas' 'gtkmm3')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/goocanvasmm/1.90/goocanvasmm-${pkgver}.tar.xz)
sha256sums=('721649be4f8bbbb4589800c0b973522d2104a95172f9eefd7b93e3bf59ae8721')

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
