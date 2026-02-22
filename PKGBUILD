# Contributor: David Vachulka <archdvx@dxsolutions.org>

pkgname=dxde
pkgver=1.40.14
pkgrel=1
pkgdesc="Program pro vedeni danove evidence (for czech tax records)"
arch=('i686' 'x86_64')
url="https://dxde.dxsolutions.org"
license=('GPL')
depends=('wxwidgets-gtk3' 'openssl' 'fontconfig' 'curl')
makedepends=('cmake')
install=${pkgname}.install
source=(https://files.dxsolutions.org/$pkgname-$pkgver.tar.gz)
md5sums=('e5680d9ea5583e3f832a9438e9e2d7b5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
