# Maintainer: Daniel Landau <aur@landau.fi> 

_pkgname=QCSXCAD
pkgname=qcsxcad
pkgver=0.6.2
pkgrel=1
pkgdesc="Qt-GUI for CSXCAD"
arch=("x86_64")
url="https://github.com/thliebig/$_pkgname"
license=("LGPL3")
depends=("csxcad-git" "openems" "tinyxml" "vtk" "qt5-base")
makedepends=("cmake")
optdepends=()
source=("https://github.com/thliebig/$_pkgname/archive/v$pkgver.tar.gz"
)
md5sums=('6c39f347e2f2464a42ec567fd79389d9')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  mkdir -p build
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  cmake ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  make install DESTDIR="$pkgdir"
}
