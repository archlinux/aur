# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=famat
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Functional analysis of metabolic and transcriptomic data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biasedurn
  r-clusterprofiler
  r-dplyr
  r-dt
  r-go.db
  r-gprofiler2
  r-keggrest
  r-magrittr
  r-ontologyindex
  r-org.hs.eg.db
  r-plotly
  r-reactome.db
  r-rwikipathways
  r-shiny
  r-shinybs
  r-shinydashboard
  r-stringr
  r-tidyr
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('02bbac6d3635bc6ae2e175ab554c0d66cdab6428bc7c26041c09af9b923fe682')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
