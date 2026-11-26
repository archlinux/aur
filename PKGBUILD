# system requirements: GNU make
# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=h5mread
_pkgver=1.5.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="A fast HDF5 reader"
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-iranges
  r-rhdf5
  r-rhdf5filters
  r-s4arrays
  r-s4vectors
  r-sparsearray
)
makedepends=(
  make
  r-rhdf5lib
)
optdepends=(
  r-biocparallel
  r-biocstyle
  r-experimenthub
  r-hdf5array
  r-knitr
  r-rmarkdown
  r-tenxbraindata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6b44ad2ef5bbec6ba4fda3e3b6a4766f')
b2sums=('9c33d3f592c2946c0c161e34a4dfe7590df5432925b0d53008bc3c1ded3946dda4053d467b1dcbd36ae6dec24f00a2f149cbfd5239bd737ff4d04654ee445d30')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
