# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Giovanni Scafora <giovanni at archlinux dot org>

pkgname=c++-gtk-utils
pkgver=2.2.20
pkgrel=1
pkgdesc="Classes and functions for programming in GTK+"
arch=('x86_64')
url="http://cxx-gtk-utils.sourceforge.net/"
license=('LGPL2.1')
depends=('gtk3')
options=('!docs' '!emptydirs')
source=("https://downloads.sourceforge.net/project/cxx-gtk-utils/cxx-gtk-utils/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a64e03e5948d074f8309b036ca0acaf9ae4025c19cef6174f2319c504fb32d8c')

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
