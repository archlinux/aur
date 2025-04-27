# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TVTB
_pkgver=1.34.0
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
md5sums=('58643bd210f9f2cd079fdcdb5c2b8a09')
b2sums=('3024c98c0f94aafe14c673a0f20ad5aa96280b0e355db1a43fbf084b79cfc731eee4c13bc8ebe41c9b500e5ab942d07044aaddbfbfac9ad050e3127882b1d3e4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
