# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=libics
pkgver=1.6.4
pkgrel=1
pkgdesc='Image Cytometry Standard file reading and writing.'
arch=('i686' 'x86_64')
url='https://svi-opensource.github.io/libics/'
license=('LGPL2.1')
depends=('zlib')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/svi-opensource/libics/archive/${pkgver}.tar.gz")
sha256sums=('8ecc2567f5969794916f952b29bc318ab71107d6dd7798e91d24b21097047464')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -k check || true
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
