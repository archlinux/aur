# Maintainer: Dominik Schreiber <dev@dominikschreiber.de>
pkgname=plasma5-runners-symbols
pkgver=1.0.3
pkgrel=1
pkgdesc="A little krunner plugin (Plasma 5) to retrieve unicode symbols, or any other string, based on a corresponding keyword"
arch=('any')
url="https://github.com/domschrei/krunner-symbols"
license=('GPL')
groups=()
depends=('krunner' 'qt5-base' 'ki18n')
makedepends=('cmake' 'extra-cmake-modules')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/domschrei/krunner-symbols/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
noextract=()

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} -DCMAKE_INSTALL_PREFIX=`kf5-config --prefix` -DQT_PLUGIN_INSTALL_DIR=`kf5-config --qt-plugins` -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make install DESTDIR="${pkgdir}"
}

md5sums=('250f55e4c06cef59f5c94293b2659d49')
