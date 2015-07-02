# Maintainer: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>

pkgname=libcutl
pkgver=1.9.0
pkgrel=1
pkgdesc="A C++ utility library"
arch=('i686' 'x86_64')
depends=('gcc-libs')
url="http://www.codesynthesis.com/projects/libcutl/"
options=('!libtool')
license=('MIT')
source=("http://www.codesynthesis.com/download/libcutl/1.9/libcutl-${pkgver}.tar.bz2")
md5sums=('54cf1f421a520e79dd06c436a8b968d3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make ECHO=echo
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make ECHO=echo DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
