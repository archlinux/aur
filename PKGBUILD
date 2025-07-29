# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenomicSuperSignature
_pkgver=1.16.1
pkgname=r-${_pkgname,,}
pkgver=1.16.1
pkgrel=1
pkgdesc='Interpretation of RNA-seq experiments through robust, efficient comparison to public databases'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocfilecache
  r-complexheatmap
  r-dplyr
  r-flextable
  r-ggplot2
  r-ggpubr
  r-plotly
  r-s4vectors
  r-summarizedexperiment
  r-irlba
)
optdepends=(
  r-bcellviper
  r-biocmanager
  r-biocstyle
  r-circlize
  r-cluster
  r-clusterprofiler
  r-devtools
  r-enrichmentbrowser
  r-forcats
  r-knitr
  r-msigdbr
  r-pkgdown
  r-rcolorbrewer
  r-readr
  r-reshape2
  r-rmarkdown
  r-roxygen2
  r-stats
  r-testthat
  r-tibble
  r-usethis
  r-utils
  r-wordcloud
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f31e1c3dca53b2f742a847bd4fa1a0879fba5bf5f84df8c9a10d331781ff7556')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
