# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tximport
_pkgver=1.38.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Import and summarize transcript-level estimates for transcript- and gene-level analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-arrow
  r-deseq2
  r-edger
  r-eds
  r-jsonlite
  r-knitr
  r-limma
  r-matrixstats
  r-readr
  r-rhdf5
  r-rmarkdown
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-tximportdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fe37066a1bdc5c5e3ffd98313b5a02f3')
b2sums=('69e62e8b7c9d0072d3bdd44ebfdcb4713998540277e0374230c742ed7ecc339849650de6929acd0ca03a5a424b5b7261e0bc7f3c321a65a794ef86b7ce4b3338')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
