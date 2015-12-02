# Maintainer: M0Rf30

pkgname=ndpi
pkgver=1.6
pkgrel=1
pkgdesc="Open and Extensible GPLv3 Deep Packet Inspection Library"
arch=('i686' 'x86_64')
url="http://www.ntop.org/products/ndpi/"
license=('GPL3')
conflicts=('ndpi-svn')

source=("http://ftp.de.debian.org/debian/pool/main/n/ndpi/ndpi_$pkgver.orig.tar.gz")

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

md5sums=('39d909c895c3273144416d439871c429')
