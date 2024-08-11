# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BgeeCall
_pkgver=1.20.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Automatic RNA-Seq present/absent gene expression calls generation"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biomart
  r-biostrings
  r-data.table
  r-dplyr
  r-genomicfeatures
  r-jsonlite
  r-rhdf5
  r-rslurm
  r-rtracklayer
  r-sjmisc
  r-txdbmaker
  r-tximport
)
optdepends=(
  r-annotationhub
  r-httr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('34fef568d3c3aab32977992a57ec9d4c')
b2sums=('65813d4c52a498dbc7ca57bcaa2789a53c647ae7b37920fecd99ba7b2012c5b222c324e92a03b1b8d1cb6949656c55dd9e9d4663f86fcd4d4980b340658f479e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
