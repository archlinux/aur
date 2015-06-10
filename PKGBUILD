# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=c++-gtk-utils-gtk2
_pkgname=c++-gtk-utils
pkgver=2.0.24
pkgrel=1
pkgdesc="Classes and functions for programming in GTK+"
arch=('i686' 'x86_64')
url="http://cxx-gtk-utils.sourceforge.net/"
license=('LGPL2.1')
provides=($_pkgname=$pkgver)
replaces=($_pkgname)
conflicts=($_pkgname)
depends=('gtk2')
options=('!libtool' '!docs' '!emptydirs')
source=("http://downloads.sourceforge.net/project/cxx-gtk-utils/cxx-gtk-utils/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('61cdf1bf94a5ac3430dd5ea39946142b')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure-gtk2 --prefix=/usr \
              --disable-rpath \
              --disable-static
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
