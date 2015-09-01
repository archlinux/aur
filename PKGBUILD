# Maintainer: jose1711 <jose1711 at gmail at com>

pkgname=jpegtran_crop
pkgver=9b
pkgrel=1
pkgdesc="Stable jpegtran version with the lossless crop and scale feature"
arch=('i686' 'x86_64')
url="http://sylvana.net/jpegcrop/jpegtran/"
license=('other')
source=("http://sylvana.net/jpegcrop/jpegcrop.tar.gz")
md5sums=('697a1b93f7872a038af9c9f0de33d4aa')
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
