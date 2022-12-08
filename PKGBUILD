# Maintainer: Ruben Bekaert <bekaertruben@gmail.com>

pkgname=pygplates

pkgdesc="PyGPlates enables access to GPlates functionality via the Python programming language."
url="https://www.gplates.org"
license=(GPLv2)

arch=(x86_64)
pkgver=0.36.0
pkgrel=1

depends=(python gplates=2.3.0)
makedepends=(cmake doxygen)

source=(${pkgname}_${pkgver}_src.zip::https://www.earthbyte.org/download/9112)
sha256sums=("f18b34ea5f3f70c7df7b09190dc14cd0ff17eab084a116f45e629511fae95003")

build() {
  cd "${srcdir}/${pkgname}_${pkgver}_src"
  cmake -DCMAKE_INSTALL_PREFIX="/usr/" -DCMAKE_BUILD_TYPE=Release .
}

package() {
  cd "${srcdir}/${pkgname}_${pkgver}_src"
  make DESTDIR="${pkgdir}/" install
}
