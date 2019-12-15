# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-footprints
_pkgver="5.1.5"
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Official KiCad footprint libraries -- stable and RC releases"
arch=('any')
url="https://kicad.github.io/footprints"
license=('GPL')
makedepends=('cmake')
conflicts=('kicad-footprints-git' 'kicad-library-git')
provides=(kicad-footprints)
source=("https://github.com/KiCad/kicad-footprints/archive/${_pkgver}.tar.gz")
md5sums=('7722484abaf84a78dadc925070a07f7f')

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
