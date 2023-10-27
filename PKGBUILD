# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MatrixQCvis
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Shiny-based interactive data-quality exploration for omics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-complexheatmap
  r-dplyr
  r-experimenthub
  r-ggplot2
  r-hmisc
  r-htmlwidgets
  r-impute
  r-imputelcmd
  r-limma
  r-pcamethods
  r-plotly
  r-proda
  r-rlang
  r-rmarkdown
  r-rtsne
  r-shiny
  r-shinydashboard
  r-shinyhelper
  r-shinyjs
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-umap
  r-upsetr
  r-vsn
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-hexbin
  r-jpeg
  r-knitr
  r-statmod
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('694b2e673fc5c2ab99e6be1a2d378799f412e10977ca1c343da7ee1c2c903737')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
