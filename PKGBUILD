# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=isomiRs
_pkgver=1.32.1
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
md5sums=('96074868729ea613649a0775ee06b5b6')
b2sums=('22ae13d0cc8c6f45b0e1e1ff523ab36bc8895b7a75488cf3372f5c9e5eaccb7e2b0bfa087d325af24b6c80eac3bde0241ee1c42e64a17a9d1f7bac8b765b36ec')

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
