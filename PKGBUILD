# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-footprints
_pkgver="5.0.0"
pkgver=${_pkgver//-}
pkgrel=1
pkgdesc="Official KiCad footprint libraries -- stable and RC releases"
arch=('any')
url="https://kicad.github.io/footprints"
license=('GPL')
makedepends=('cmake')
conflicts=('kicad-footprints-git')
provides=(kicad-footprints)
source=("https://github.com/KiCad/kicad-footprints/archive/${_pkgver}.tar.gz")
md5sums=('e8ce40c47b108280d7878f858899ab10')

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
