# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GA4GHshiny
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
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
sha256sums=('842481a24ec5889aeadd5dac595a867b719cd52aefae016f8aeffd5901bcc8b5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
