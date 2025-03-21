# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=famat
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
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
sha256sums=('aa03d4cf992894b58f7578f3b6f38d8ee8cc2550c3d27c6ac251a9688b15437e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
