pkgname=scantool
pkgver=2.1
pkgrel=1
pkgdesc="OBD-II vehicle diagnostic scanner"
arch=('x86_64')
url="https://github.com/kees/scantool"
license=('GPL')
depends=('allegro4')
source=("https://github.com/kees/scantool/archive/v${pkgver}.tar.gz")
sha256sums=('ce949dac4a11f1c2a11ca8437552dc9673d98c5c3993cd313bafcac06f7469de')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  curl -L https://github.com/kees/scantool/pull/3.patch | patch -p1
  make
}

package () {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make install DESTDIR="${pkgdir}"
}
