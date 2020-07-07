# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Laurent Meunier <laurent@deltalima.net>

pkgname=goocanvasmm
pkgver=1.90.11
pkgrel=4
pkgdesc='C++ wrappers for goocanvas'
arch=('x86_64')
url='https://download.gnome.org/sources/goocanvasmm/'
license=('GPL')
depends=('goocanvas' 'gtkmm3')
source=(https://download.gnome.org/sources/goocanvasmm/1.90/goocanvasmm-${pkgver}.tar.xz)
sha512sums=('f4decc16fc927dd044714558d1edd5a1dc53bc084b1ad361f791bb3f21bedd298a14aa603e3087df7c61d6d873c86a5b00e1ff82cffa5cafa7f06e86b59a7241')

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
