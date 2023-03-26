# Contributor: David Vachulka <archdvx@dxsolutions.org>

pkgname=dxreminders
pkgver=1.21.1
pkgrel=1
pkgdesc="A simple program for reminders"
arch=('i686' 'x86_64')
url="https://dxreminders.dxsolutions.org"
license=('GPL')
depends=('wxwidgets-gtk3')
makedepends=('cmake')
install=${pkgname}.install
source=(https://files.dxsolutions.org/$pkgname-$pkgver.tar.gz)
md5sums=('fe1b64dd169d7f13cb89b5447fa6be8b')

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
