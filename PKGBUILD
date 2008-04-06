# $Id: PKGBUILD,v 1.7 2008/03/03 18:36:19 tobias Exp $
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Rainer Moll <renari@arcor.de>

pkgname=t1lib
pkgver=5.1.2
pkgrel=1
pkgdesc="Library for generating character- and string-glyphs from Adobe Type 1 fonts"
arch=(i686 x86_64)
license=("GPL")
depends=('libxaw')
options=(!libtool)
url="http://www.ibiblio.org/pub/Linux/libs/graphics/!INDEX.html"
source=(http://www.ibiblio.org/pub/Linux/libs/graphics/${pkgname}-${pkgver}.tar.gz )
md5sums=('a5629b56b93134377718009df1435f3c')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make without_doc || return 1
  make prefix=$startdir/pkg/usr install
}
