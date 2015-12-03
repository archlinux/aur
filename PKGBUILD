# Maintainer: leepesjee <lpeschier at xs4all dot nl>
pkgname=neartree
pkgver=3.1.1
pkgrel=2
pkgdesc="A library for finding nearest neighbors among points in spaces of arbitrary dimensions"
arch=('i686' 'x86_64')
url="http://neartree.sourceforge.net/"
license=('LGPL')
depends=('glibc' 'cvector')
source=(http://downloads.sf.net/neartree/NearTree-${pkgver}.tar.gz)
md5sums=('c728f5aa4dabdf34eb8a0e8d75eaaa1d')

prepare() {
  cd $srcdir/NearTree-${pkgver}
  sed -i "s|INSTALL_PREFIX = /usr/local|INSTALL_PREFIX = ${pkgdir}/usr|" ./Makefile
}

build() {
  cd $srcdir/NearTree-${pkgver}
  make
}

package() {
  cd $srcdir/NearTree-${pkgver}
  make install
  # do not install the libtool thing
  rm ${pkgdir}/usr/lib/*.la
}
