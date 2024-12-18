# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BgeeCall
_pkgver=1.22.0
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
md5sums=('4c2e44c5068cb6d4f72ce57b41232eba')
b2sums=('364a7a4adaf804ecc237d9a93efdaca18f86eae8591c6998d261bbadb23c2af61319cd82c9ed1da22ecce9a0f654636851b752d9a1400078975a3030a3496725')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
