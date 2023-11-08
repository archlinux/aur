# Maintainer: Chih-Hsuan Yen <base64_decode("eXUzYWN0eHQydHR0ZmlteEBjaHllbi5jYwo=")>

_pkgname=lxqt-menu-data
pkgname=$_pkgname-git
pkgver=1.4.0
pkgrel=1
pkgdesc='LXQt menu files'
arch=(any)
url='https://github.com/lxqt/lxqt-menu-data'
license=('GPL' 'LGPL')
makedepends=(git cmake lxqt-build-tools-git qt5-tools)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=('git+https://github.com/lxqt/lxqt-menu-data.git')
sha256sums=('SKIP')

pkgver() {
  cd lxqt-menu-data
  git describe --always | sed 's:-:.:g'
}

build() {
  cmake -B build -S lxqt-menu-data \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  make -C build
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
