# Maintainer: Drommer <drommer@github.com>

_pkgname=org.kde.plasma.separator
pkgname=plasma5-applets-separator
pkgver=0.1
pkgrel=1
pkgdesc="Just a Separator. What did you expect?"
url="https://store.kde.org/p/998907"
arch=('any')
license=('GPL3')
depends=('plasma-workspace')
makedepends=('cmake' 'extra-cmake-modules' 'gettext')
source=("${_pkgname}.tar.gz")
sha256sums=('2190bdf79869c7736e5e16560137be35eefdaa3713c43385c77f1eea95e08a3d')

prepare() {
  mkdir "${srcdir}/build"
}

build () {
  cd "${srcdir}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
        "../${_pkgname}"
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
