# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=c++-gtk-utils
pkgver=2.2.17
pkgrel=1
pkgdesc="Classes and functions for programming in GTK+"
arch=('x86_64')
url="http://cxx-gtk-utils.sourceforge.net/"
license=('LGPL2.1')
depends=('gtk3')
options=('!docs' '!emptydirs')
source=("https://downloads.sourceforge.net/project/cxx-gtk-utils/cxx-gtk-utils/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4be5cf289f62e7e24ba4c4d1a5b2c07c4beffe9049e85d9774dbc4ea369c4a04')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
     --prefix=/usr \
     --disable-rpath \
     --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
