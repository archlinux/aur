# Maintainer: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>

pkgname=libodb-mysql
pkgver=2.4.0
pkgrel=1
pkgdesc="The ODB MySQL runtime library"
arch=('i686' 'x86_64')
depends=('libodb' 'libmariadbclient')
url="http://www.codesynthesis.com/products/odb/"
options=('!libtool')
license=('GPL')
source=("http://www.codesynthesis.com/download/odb/2.4/libodb-mysql-${pkgver}.tar.bz2")
md5sums=('e4dc2f445c5e7dd0c06da939f9599dc8')

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
