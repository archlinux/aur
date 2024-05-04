# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scRNAseq
_pkgver=2.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Collection of Public Single-Cell RNA-Seq Datasets"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('CC0-1.0')
depends=(
  r-alabaster.base
  r-alabaster.matrix
  r-alabaster.sce
  r-annotationdbi
  r-annotationhub
  r-biocgenerics
  r-dbi
  r-delayedarray
  r-ensembldb
  r-experimenthub
  r-genomicfeatures
  r-genomicranges
  r-gypsum
  r-jsonlite
  r-rsqlite
  r-s4vectors
  r-singlecellexperiment
  r-sparsearray
  r-summarizedexperiment
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-jsonvalidate
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('80c2b37a7e0ca773dfbcd4bae66cff6d')
b2sums=('1b90b24c34d59ac24034c90e6c387123ba4d39e3e4f67d6953e106356cf22d186471ce6988a4359a97409a9501e69843407611a51efb746d24954a17831007a4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
