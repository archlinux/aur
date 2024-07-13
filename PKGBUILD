# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TVTB
_pkgver=1.30.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The VCF Tool Box"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationfilter
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-ensembldb
  r-genomeinfodb
  r-genomicranges
  r-ggally
  r-ggplot2
  r-gviz
  r-iranges
  r-limma
  r-reshape2
  r-rsamtools
  r-s4vectors
  r-summarizedexperiment
  r-variantannotation
)
optdepends=(
  r-biocstyle
  r-covr
  r-dt
  r-ensdb.hsapiens.v75
  r-knitr
  r-pander
  r-rmarkdown
  r-rtracklayer
  r-shiny
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('829d498079053c3c33458d8fcd2c94e2')
b2sums=('0af6e8c5dd43f1efda3331b7534a3357f6ef1773a4d7a7182e103c18e631c67dcd8311d0154c95c5bd16ae2b22502bb35fbe0e63ee279028ad7a2a17e3323aeb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
