# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=POMA
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='User-friendly Workflow for Metabolomics and Proteomics Data Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-broom
  r-caret
  r-clisymbols
  r-complexheatmap
  r-crayon
  r-dplyr
  r-e1071
  r-ggcorrplot
  r-ggplot2
  r-ggraph
  r-ggrepel
  r-glasso
  r-glmnet
  r-impute
  r-knitr
  r-limma
  r-magrittr
  r-mixomics
  r-msnbase
  r-patchwork
  r-qpdf
  r-randomforest
  r-rankprod
  r-rmarkdown
  r-tibble
  r-tidyr
  r-vegan
  r-summarizedexperiment
)
optdepends=(
  r-biobase
  r-biocstyle
  r-covr
  r-plotly
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ada5f3a0e8229151c793fcfe135668842a0723f4a6b2494eb336cebe2798a1c9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
