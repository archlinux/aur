# Contributor: David Vachulka <archdvx@dxsolutions.org>

pkgname=dxtime
pkgver=1.2.6
pkgrel=1
pkgdesc="Program for time tracking"
arch=('i686' 'x86_64')
url="https://dxtime.dxsolutions.org"
license=('GPL')
depends=('wxwidgets-gtk3' 'curl')
makedepends=('cmake')
install=${pkgname}.install
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('35fcc8892ff891064905195969ef62b3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir" install
}
