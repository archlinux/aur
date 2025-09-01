# Contributor: David Vachulka <archdvx@dxsolutions.org>

pkgname=dxreminders
pkgver=1.21.4
pkgrel=1
pkgdesc="A simple program for reminders"
arch=('i686' 'x86_64')
url="https://dxreminders.dxsolutions.org"
license=('GPL')
depends=('wxwidgets-gtk3')
makedepends=('cmake' 'ninja')
install=${pkgname}.install
source=(https://files.dxsolutions.org/$pkgname-$pkgver.tar.gz)
md5sums=('63d5762a4aff944aad6e2098510b9e6c')

build() {
  cmake -S $pkgname-$pkgver -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
