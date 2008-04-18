# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=jasper
pkgver=1.900.1
pkgrel=1
pkgdesc="a software-based implementation of the codec specified in the emerging JPEG-2000 Part-1 standard"
arch=(i686 x86_64)
url="http://www.ece.uvic.ca/~mdadams/jasper/"
source=(http://www.ece.uvic.ca/~mdadams/$pkgname/software/$pkgname-$pkgver.zip)
makedepends=('unzip')
depends=('libjpeg' 'glut' 'libxi' 'libxmu' 'mesa')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-shared
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

# libtoolslay
find $startdir/pkg -name '*.la' -exec rm {} \;
}
