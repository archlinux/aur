# Maintainer: David Baum <david.baum@naraesk.eu>
pkgname=plasma5-applets-feedreader
pkgver=1.0.2
pkgrel=1
pkgdesc="System tray support for Feedreader"
arch=('i686' 'x86_64')
url="https://github.com/naraesk/plasma-feedreader"
license=('GPL3')
groups=()
depends=('plasma-workspace' 'feedreader')
makedepends=('cmake' 'extra-cmake-modules' 'ki18n' 'qt5-base' 'qt5-declarative' 'qt5-tools')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=''
changelog=''
source=("$pkgname-$pkgver.tar.gz::https://github.com/naraesk/plasma-feedreader/archive/v1.0.2.tar.gz")
noextract=()
sha256sums=('37399250e18585f18bdc3d2b84ad7bb6ec7a473f248c16665618cd6a32d36d31')

build() {
  cd plasma-feedreader-${pkgver}
  mkdir -p build
  cd build
  cmake ../ \
    -DCMAKE_INSTALL_PREFIX=`qtpaths --install-prefix` \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd plasma-feedreader-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}
