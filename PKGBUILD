# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-packages3d
_pkgver="5.0.0-rc3"
pkgver=${_pkgver//-}
pkgrel=1
pkgdesc="Official KiCad 3D model libraries -- stable release"
arch=('any')
url="https://kicad.github.io/packages3d"
license=('GPL')
makedepends=('cmake')
conflicts=('kicad-packages3d-git')
provides=($pkgname)
source=("https://github.com/KiCad/${pkgname}/archive/${_pkgver}.tar.gz")
md5sums=('c31de79a5a87669f13dc59907c85fb5f')

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
