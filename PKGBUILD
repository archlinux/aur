# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HDF5Array
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="HDF5 datasets as array-like objects in R"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  curl
  openssl
  r-biocgenerics
  r-delayedarray
  r-iranges
  r-rhdf5
  r-rhdf5filters
  r-s4arrays
  r-s4vectors
  r-sparsearray
  zlib
)
makedepends=(
  r-rhdf5lib
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
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('82321c8a1bad0392f898462a6d8a1d60')
b2sums=('2a169e4f806dbc3d25e3007f19e58af0131c9be397a2a69d7e738fa91d6f94c8fe8fd917e5725d8d3221b7a8a58ee03873d1c390660a7cb59d17dc52c221f809')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
