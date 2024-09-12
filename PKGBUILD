# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=libics
pkgver=1.6.8
pkgrel=1
pkgdesc='Image Cytometry Standard file reading and writing.'
arch=('i686' 'x86_64')
url='https://svi-opensource.github.io/libics/'
license=('LGPL2.1')
depends=('zlib')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/svi-opensource/libics/archive/${pkgver}.tar.gz")
sha256sums=('f6df0440a2c17ecf924d5fc91e5ab47a41782c01dab44777d62becd253b770c2')

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
