# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-packages3d
_pkgver="5.0.0"
pkgver=${_pkgver//-}
pkgrel=1
pkgdesc="Official KiCad 3D model libraries -- stable and rc releases"
arch=('any')
url="https://kicad.github.io/packages3d"
license=('GPL')
makedepends=('cmake')
conflicts=('kicad-packages3d-git')
provides=($pkgname)
source=("https://github.com/KiCad/${pkgname}/archive/${_pkgver}.tar.gz")
md5sums=('aac66499bbbd9f21ad3e90af7ba854d2')

build() {
  cd "$srcdir"
  mkdir -p "$srcdir/build/"
  cd "$srcdir/build"
  #cmake ../${pkgname}-${_pkgver} -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake ../kicad-packages3D-${_pkgver} -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install
}
