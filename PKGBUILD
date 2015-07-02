# Maintainer: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>

pkgname=odb
pkgver=2.4.0
pkgrel=1
pkgdesc="C++ Object-Relational Mapping compiler"
arch=('i686' 'x86_64')
depends=('libcutl')
url="http://www.codesynthesis.com/products/odb/"
options=('!libtool')
license=('GPL')
source=("http://www.codesynthesis.com/download/odb/2.4/odb-${pkgver}.tar.bz2")
md5sums=('0146d0223f874a9434673682a5669638')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  CXXFLAGS="${CXXFLAGS} -fno-devirtualize"

  ./configure --prefix=/usr --libexecdir=/usr/lib
  make ECHO=echo
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make ECHO=echo DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
