# Maintainer: jose1711 <jose1711 at gmail at com>

pkgname=jpegtran_crop
pkgver=9d
pkgrel=1
pkgdesc="Stable jpegtran version with the lossless crop and scale feature"
arch=('i686' 'x86_64')
url="http://sylvana.net/jpegcrop/jpegtran/"
license=('other')
source=("http://sylvana.net/jpegcrop/jpegcrop.tar.gz")
md5sums=('c49521506af43d9faebc91ee1c85a105')
conflicts=('jpegtran_crop_bin' 'libjpeg-turbo')

build() {
  cd ${srcdir}/jpegcrop/jpeg-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/jpegcrop/jpeg-${pkgver}
  make DESTDIR=${pkgdir} install
}
