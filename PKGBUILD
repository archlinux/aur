# Maintainer: M0Rf30

pkgname=ndpi
pkgver=1.8
pkgrel=1
pkgdesc="Open and Extensible GPLv3 Deep Packet Inspection Library"
arch=('i686' 'x86_64')
url="http://www.ntop.org/products/ndpi/"
license=('GPL3')
conflicts=('ndpi-svn')

source=("http://downloads.sourceforge.net/project/ntop/nDPI/nDPI-$pkgver.tgz")

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

md5sums=('5148035aa8bc03be5ca9e277e8bc419c')
