# Maintainer: M0Rf30

pkgname=ndpi
pkgver=1.5.0
pkgrel=1
pkgdesc="Open and Extensible GPLv3 Deep Packet Inspection Library"
arch=('i686' 'x86_64')
url="http://www.ntop.org/products/ndpi/"
license=('GPL3')
conflicts=('ndpi-svn')

source=("http://ftp.de.debian.org/debian/pool/main/n/ndpi/ndpi_$pkgver.orig.tar.gz")

build() {
  cd ${srcdir}/libndpi-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/libndpi-$pkgver
  make DESTDIR="${pkgdir}/" install
}

md5sums=('d6659045aab8d5cfe0778605bf408d00')
