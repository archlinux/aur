# Contributor: David Vachulka <archdvx@dxsolutions.org>

pkgname=wxdfast
pkgver=0.70.4
pkgrel=1
pkgdesc="Multithread download manager"
arch=('i686' 'x86_64')
url="https://wxdfast.dxsolutions.org"
license=('GPL')
depends=('wxwidgets-gtk3' 'aria2' 'openssl')
makedepends=('cmake')
install=${pkgname}.install
source=(https://github.com/archdvx/wxdfast/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('f92fb9cad33f0909fda5552735b3bc87')

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
