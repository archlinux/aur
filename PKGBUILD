# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GA4GHshiny
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Shiny application for interacting with GA4GH-based data servers'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biocgenerics
  r-dplyr
  r-dt
  r-ga4ghclient
  r-genomeinfodb
  r-genomicfeatures
  r-openxlsx
  r-purrr
  r-s4vectors
  r-shiny
  r-shinyjs
  r-shinythemes
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('51a5ef44eeb82c7ff88a1f42064e425cbe47a77820473f0816f83f3655b840ee')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
