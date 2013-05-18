# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Laurent Meunier <laurent@deltalima.net>

pkgname=goocanvasmm
pkgver=1.90.9
pkgrel=1
pkgdesc='C++ wrappers for goocanvas'
arch=('i686' 'x86_64')
url='http://ftp.gnome.org/pub/gnome/sources/goocanvasmm/'
license=('GPL')
depends=('goocanvas' 'gtkmm3')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/goocanvasmm/1.90/goocanvasmm-${pkgver}.tar.xz)
sha256sums=('a2f52fbff4f753602bb55ac8588201efd5f193c890df6dfc72004eaaf5daae92')

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
