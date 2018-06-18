# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-footprints
_pkgver="5.0.0-rc2"
pkgver=${_pkgver//-}
pkgrel=1
pkgdesc="Official KiCad footprint libraries -- stable release"
arch=('any')
url="https://kicad.github.io/footprints"
license=('GPL')
makedepends=('cmake')
conflicts=('kicad-footprints-git')
provides=($pkgname)
source=("https://github.com/KiCad/kicad-footprints/archive/${_pkgver}.tar.gz")
md5sums=('177a9270cd8abbb96134fa2ee3f7a9a0')

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
