# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scRNAseq
_pkgver=2.20.0
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
md5sums=('9712b05cec1dd4c33c67fffa06e3257d')
b2sums=('0be070ca9527a9da80ef6fe25b07bbb4c246b46ee24bcac2d3f3730c2ed6bd7ac3891200696264dee92b520b6b6502442cd65b20872e54a69f1b9ae8772277e3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
