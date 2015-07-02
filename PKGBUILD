# Maintainer: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>

pkgname=libodb-qt
pkgver=2.4.0
pkgrel=1
pkgdesc="The ODB Qt profile library"
arch=('i686' 'x86_64')
depends=('libodb' 'qt5-base')
url="http://www.codesynthesis.com/products/odb/"
options=('!libtool')
license=('GPL')
source=("http://www.codesynthesis.com/download/odb/2.4/libodb-qt-${pkgver}.tar.bz2")
md5sums=('013b93cd7ab41fb8ce6e73da367c5931')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --libdir=/usr/lib/odb --with-pkgconfigdir=/usr/lib/pkgconfig --with-libodb=/usr/lib
  make ECHO=echo
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make ECHO=echo DESTDIR="${pkgdir}" install

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
