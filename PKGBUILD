# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=isomiRs
_pkgver=1.36.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analyze isomiRs and miRNAs from small RNA-seq"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-broom
  r-cowplot
  r-degreport
  r-deseq2
  r-dplyr
  r-genomicranges
  r-ggally
  r-ggplot2
  r-gplots
  r-gridextra
  r-gtools
  r-iranges
  r-limma
  r-rcolorbrewer
  r-readr
  r-reshape
  r-rlang
  r-s4vectors
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-org.mm.eg.db
  r-pheatmap
  r-rmarkdown
  r-targetscan.hs.eg.db
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1a0255ce19a5ad3f7a22c5c64a816bd2')
b2sums=('4abc2b8e23389821bd10e0d5cd1c3d3690498e4ef0206c7144020a6f9f67135ea26ff3e7e7f0b83cd350f3f806d025d2809e88e4085a06c080ed8e3b4a94c5cf')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
