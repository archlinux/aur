# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>

pkgname=c++-gtk-utils
pkgver=2.2.15
pkgrel=1
pkgdesc="Classes and functions for programming in GTK+"
arch=('x86_64')
url="http://cxx-gtk-utils.sourceforge.net/"
license=('LGPL2.1')
depends=('gtk3')
options=('!docs' '!emptydirs')
source=("http://downloads.sourceforge.net/project/cxx-gtk-utils/cxx-gtk-utils/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --disable-rpath \
              --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
