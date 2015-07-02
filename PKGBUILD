# Maintainer: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>

pkgname=libodb-sqlite
pkgver=2.4.0
pkgrel=1
pkgdesc="The ODB SQLite runtime library"
arch=('i686' 'x86_64')
depends=('libodb' 'sqlite')
url="http://www.codesynthesis.com/products/odb/"
options=(!libtool)
license=('GPL')
source=("http://www.codesynthesis.com/download/odb/2.4/libodb-sqlite-${pkgver}.tar.bz2")
md5sums=('4415627849cd7d9f5dac7a160b245d4c')

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
