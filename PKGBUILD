# Maintainer: Daniel Landau <aur@landau.fi> 

_pkgname=AppCSXCAD
pkgname=appcsxcad
pkgver=0.2.2
pkgrel=2
pkgdesc="Minimal GUI Application using the QCSXCAD library."
arch=("x86_64")
url="https://github.com/thliebig/$_pkgname"
license=("GPL3")
depends=("csxcad-git" "hdf5" "vtk" "qt5-base")
makedepends=("cmake")
optdepends=()
source=("https://github.com/thliebig/$_pkgname/archive/v$pkgver.tar.gz"
)
md5sums=('97d4cbc9c116579c8bfd5bde00e80627')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  mkdir -p build
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  make install DESTDIR="$pkgdir"
}
