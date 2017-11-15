# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Laurent Meunier <laurent@deltalima.net>

pkgname=goocanvasmm
pkgver=1.90.11
pkgrel=2
pkgdesc='C++ wrappers for goocanvas'
arch=('x86_64')
url='https://download.gnome.org/sources/goocanvasmm/'
license=('GPL')
depends=('goocanvas' 'gtkmm3')
source=(https://download.gnome.org/sources/goocanvasmm/1.90/goocanvasmm-${pkgver}.tar.xz)
sha256sums=('80ff11873ec0e73d9e38b0eb2ffb1586621f0b804093b990e49fdb546476ed6e')

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
