# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MatrixQCvis
_pkgver=1.20.2
pkgname=r-${_pkgname,,}
pkgver=1.20.2
pkgrel=1
pkgdesc='Shiny-based interactive data-quality exploration for omics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
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
  r-sva
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
sha256sums=('ba2b135f10b7e91b780e8bb39d26dcd2a578cfcc778391fa08ece5a79df466ba')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
