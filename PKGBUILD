# Maintainer: M0Rf30

pkgname=ndpi
pkgver=1.8
pkgrel=3
pkgdesc="Open and Extensible GPLv3 Deep Packet Inspection Library"
arch=('i686' 'x86_64')
url="http://www.ntop.org/products/ndpi/"
license=('GPL3')
conflicts=('ndpi-svn')
options=('staticlibs')
source=("http://downloads.sourceforge.net/project/ntop/nDPI/nDPI-$pkgver.tar.gz")

build() {
  cd ${srcdir}/nDPI-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/nDPI-$pkgver
  make DESTDIR="${pkgdir}/" install
}

md5sums=('f592e8200a192f1328cacb51c532f676')
