# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TVTB
_pkgver=1.38.0
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
  r-genomicranges
  r-ggally
  r-ggplot2
  r-gviz
  r-iranges
  r-limma
  r-reshape2
  r-rsamtools
  r-s4vectors
  r-seqinfo
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
md5sums=('0079a1cbc894ecd77e2abdadaa7dc0fb')
b2sums=('aad02dad810b7610981bb70cd6b5b326b2199c42caf76749fbdbdc691b2477a014e9ac1b80122de52d19e534d2f2c70007cefc11026aed0eed995e1311106bd7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
