# system requirements: GNU make
# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=h5mread
_pkgver=1.0.0
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
  r-rhdf5lib
  r-s4arrays
  r-s4vectors
  r-sparsearray
)
makedepends=(
  make
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
md5sums=('caef4c788cb34775b55f31943323b150')
b2sums=('3d094ad17b9bbf6f49b9d5b8a36381487e46a47011983b07afbd1c76ffc070e3f9fb9ac603c870f2de0b775d3affd53f2be32ccd3b32be1881d6ffe95b0f2878')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
