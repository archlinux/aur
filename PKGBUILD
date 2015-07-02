# Maintainer: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>

pkgname=libodb-oracle
pkgver=2.4.0
pkgrel=1
pkgdesc="The ODB Oracle runtime library"
arch=('i686' 'x86_64')
depends=('libodb' 'oracle-instantclient-sqlplus' 'oracle-instantclient-sdk' 'unixodbc')
url="http://www.codesynthesis.com/products/odb/"
options=('!libtool')
license=('custom')
source=("http://www.codesynthesis.com/download/odb/2.4/libodb-oracle-${pkgver}.tar.bz2")
md5sums=('7be266404a7512d2ec196b0148fad6bb')

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
