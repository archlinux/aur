pkgname=libbatch
pkgver=2.4.5
pkgrel=1
pkgdesc="Generic platform for Pre and Post-Processing for numerical simulation - libBatch library"
url="http://www.salome-platform.org"
depends=('python')
makedepends=('swig')
arch=('x86_64')
license=('LGPL')
source=("http://files.salome-platform.org/Salome/other/libBatch-${pkgver}.tar.gz")
sha256sums=('a2b5bdf7db95db31ba08b7d07d748141dfadfb537ccc742108e0ceb0a4947cc1')

build() {
  cd "$srcdir/libBatch-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/libBatch-${pkgver}"
  make DESTDIR="$pkgdir" install

}
