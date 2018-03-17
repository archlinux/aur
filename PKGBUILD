# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-packages3d
_pkgver="5.0.0-rc1"
pkgver=${_pkgver//-}
pkgrel=1
pkgdesc="Official KiCad 3D model libraries -- stable release"
arch=('any')
url="https://kicad.github.io/packages3d"
license=('GPL')
makedepends=('cmake')
conflicts=('kicad-packages3d-git')
provides=($pkgname)
source=("https://github.com/KiCad/kicad-packages3d/archive/${_pkgver}.tar.gz")
md5sums=('d288cb87bf3a12cd180365cb23214b40')

build() {
  cd "$srcdir"
  mkdir -p "$srcdir/build/"
  cd "$srcdir/build"
  cmake ../${pkgname}-${_pkgver} -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install
}
