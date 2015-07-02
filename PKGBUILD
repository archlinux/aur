# Maintainer: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>

pkgname=libodb-boost
pkgver=2.4.0
pkgrel=1
pkgdesc="The ODB boost profile library"
arch=('i686' 'x86_64')
depends=('libodb' 'boost-libs')
url="http://www.codesynthesis.com/products/odb/"
options=('!libtool')
license=('GPL')
source=("http://www.codesynthesis.com/download/odb/2.4/libodb-boost-${pkgver}.tar.bz2")
md5sums=('6b0127619cab3244ae838780db890b9d')

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
