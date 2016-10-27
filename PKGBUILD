# Maintainer: Maciej Sieczka <msieczka at sieczka dot org>
# Contributor: Michael <mbostwick89@gmail.com>

pkgname='laszip'
pkgver='2.2.0'
pkgrel='5'
pkgdesc='ASPRS LAS lossless compression library.'
arch=('i686' 'x86_64')
url='http://www.laszip.org'
license=('LGPL')
source=("http://download.osgeo.org/laszip/${pkgname}-src-${pkgver}.tar.bz2")
md5sums=('93194700623f6aca470454299361e89d')

build() {
  cd "${srcdir}/${pkgname}-src-${pkgver}"
  ./configure --prefix='/usr' --includedir="/usr/include/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-src-${pkgver}"
  make DESTDIR="$pkgdir" install
}
