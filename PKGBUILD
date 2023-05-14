# Maintainer: SoftExpert <softexpert at gmail dot com>

_pkgname=crystal-dock
pkgname=${_pkgname}-git
pkgver=1.0.rc3
pkgrel=1
epoch=0
arch=(x86_64)
pkgdesc='A cool desktop panel for Linux desktop'
arch=('x86_64')
url='https://github.com/dangvd/crystal-dock'
license=('GPL3')
provides=(crystal-dock)
conflicts=(crystal-dock)
depends=(qt5-base kwin)
makedepends=(cmake git extra-cmake-modules kcmutils)
source=("${_pkgname}::git+https://github.com/dangvd/crystal-dock.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build
  cd build
  cmake  \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ../src
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" cmake --install build
}

# vim:set ts=8 sts=2 sw=2 et:
