# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=alevinQC
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Generate QC Reports For Alevin Output'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-cowplot
  r-dplyr
  r-dt
  r-ggally
  r-ggplot2
  r-rcpp
  r-rjson
  r-rlang
  r-rmarkdown
  r-shiny
  r-shinydashboard
  r-tximport
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c750fd838acb2e25299a6f2638c02ec9bdafe371690585c5e53ef6eac5ed9204')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
