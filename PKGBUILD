# Maintainer: David Baum <david.baum@naraesk.eu>
pkgname=plasma5-applets-folderlist
pkgver=1.0.0
pkgrel=1
pkgdesc="Displays a list of folders"
arch=('i686' 'x86_64')
url="https://github.com/naraesk/plasma-folderlist"
license=('GPL3')
groups=()
depends=('plasma-workspace')
makedepends=('cmake' 'extra-cmake-modules' 'ki18n' 'qt5-base' 'qt5-declarative' 'qt5-tools')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=()
changelog=()
source=('https://github.com/naraesk/plasma-folderlist/archive/v1.0.0.tar.gz')
noextract=()
md5sums=('a71d61bef9ddd2dfe47689d37de77fb4')

prepare() {
  cd plasma-folderlist-${pkgver}
  mkdir -p build
}

build() {
  cd plasma-folderlist-${pkgver}/build
  export QT_SELECT=5
  cmake ../ \
    -DCMAKE_INSTALL_PREFIX=`qtpaths --install-prefix` \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd plasma-folderlist-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}
