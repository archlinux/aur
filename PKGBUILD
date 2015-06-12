# Maintainer: jose1711 <jose1711 at gmail at com>

pkgname=jpegtran_crop
pkgver=9a
pkgrel=2
pkgdesc="Stable jpegtran version with the lossless crop and scale feature"
arch=('i686' 'x86_64')
url="http://sylvana.net/jpegcrop/jpegtran/"
license=('other')
source=("http://sylvana.net/jpegcrop/jpegcrop.tar.gz")
md5sums=('0d69b981dbedeb052c98d7f5a971a817')
conflicts=('jpegtran_crop_bin')

build() {
  cd ${srcdir}/jpegcrop/jpeg-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/jpegcrop/jpeg-${pkgver}
  make DESTDIR=${pkgdir} install
}
