# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Rainer Moll <renari@arcor.de>

pkgname=t1lib
pkgver=5.1.2
pkgrel=4
pkgdesc="Library for generating character- and string-glyphs from Adobe Type 1 fonts"
arch=('i686' 'x86_64')
url="http://www.ibiblio.org/pub/Linux/libs/graphics/!INDEX.html"
license=('GPL')
depends=('libxaw')
source=(http://www.ibiblio.org/pub/Linux/libs/graphics/${pkgname}-${pkgver}.tar.gz )
md5sums=('a5629b56b93134377718009df1435f3c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make without_doc
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
