# Maintainer:  Andrew Chen <llkiwi2006@gmail.com>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=kdeplasma-applets-gmailfeed
_pkgname=gmailfeed
pkgver=1.1
pkgrel=2
pkgdesc="A Plasma 5 plasmoid showing your Gmail feed."
arch=('i686' 'x86_64')
url="https://github.com/anthon38/gmailfeed"
license=('GPL3')
depends=('plasma-framework' 'hicolor-icon-theme' 'knotifications')
makedepends=('extra-cmake-modules')
install=${pkgname}.install
source=('https://github.com/anthon38/gmailfeed/archive/v1.1.tar.gz')
md5sums=('dce518313585f1e1c4da2cbdf0f8c676')

build() {
  cd "${_pkgname}-${pkgver}"

  mkdir build
  cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd "${_pkgname}-${pkgver}"/build

  make DESTDIR="${pkgdir}" install
}
