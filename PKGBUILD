# Maintainer: Yigit Dallilar  <yigit.dallilar@gmail.com>

pkgname=cdsclient
pkgver=3.84
pkgrel=1
pkgdesc="a set of C and csh routines o query some databases located at CDS or on mirrors over the network"
url="http://cds.u-strasbg.fr/resources/doku.php?id=cdsclient#cdsclients"
arch=('x86_64')
license=('GPL')
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
source=('http://cdsarc.u-strasbg.fr/ftp/pub/sw/cdsclient.tar.gz')
sha1sums=('f568af0011ed803808b343ba60bad0e0d81330b5')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/lib
  mkdir -p ${pkgdir}/usr/include
  mkdir -p ${pkgdir}/usr/man
  cd $srcdir/${pkgname}-${pkgver}
  make PREFIX="$pkgdir"/usr install

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

