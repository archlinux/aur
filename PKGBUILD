# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HDF5Array
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="HDF5 datasets as array-like objects in R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  curl
  openssl
  r-biocgenerics
  r-delayedarray
  r-iranges
  r-rhdf5
  r-h5mread
  r-s4arrays
  r-s4vectors
  r-sparsearray
  zlib
)
optdepends=(
  r-biocparallel
  r-delayedmatrixstats
  r-experimenthub
  r-genefilter
  r-genomicfeatures
  r-genomicranges
  r-h5vcdata
  r-runit
  r-singlecellexperiment
  r-summarizedexperiment
  r-tenxbraindata
  r-zellkonverter
  r-rspectra
  r-knitr
  r-rmarkdown
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5aba7621b31b2475b23491c7aa98e8fd')
b2sums=('3621963e01cb23d043eb258eff347f5acbc7bdf454a6b50ab3b9ac8bdfbb82bff30742518db5b1f5ca7518da5d4908e4f996f50d94469664513d2cff0a8350df')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
