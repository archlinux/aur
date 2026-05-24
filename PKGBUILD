pkgname="kst"
pkgrel=1
pkgver=3.0.0
pkgdesc="Fast real-time large-dataset viewing and plotting tool for KDE"
arch=('i686' 'x86_64')
url="https://kst-plot.kde.org"
license=('GPL-2.0')
depends=('hdf5' 'gsl' 'qt6-base' 'qt6-svg' 'qt6-tools' 'muparser' 'cfitsio' 'libtiff' 'libmatio' 'netcdf-cxx')
makedepends=('git' 'cmake')
source=("git+https://invent.kde.org/graphics/kst-plot.git#tag=3.0.0")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/kst-plot"
}

build() {
  cd "${srcdir}/kst-plot"

  cmake --install-prefix /usr
  make -j$(nproc) DESTDIR="${pkgdir}"
}

package() {
  cd "${srcdir}/kst-plot"
  make install DESTDIR="${pkgdir}"
}
