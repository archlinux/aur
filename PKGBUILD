# Maintainer: M0Rf30

pkgname=ndpi
pkgver=2.0
pkgrel=1
pkgdesc="Open and Extensible GPLv3 Deep Packet Inspection Library"
arch=('i686' 'x86_64')
url="http://www.ntop.org/products/ndpi/"
license=('GPL3')
conflicts=('ndpi-svn')
options=('staticlibs')
source=("https://github.com/ntop/nDPI/archive/$pkgver.tar.gz")

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

md5sums=('28e6c5e5361a56206a79b100c25947c3')
