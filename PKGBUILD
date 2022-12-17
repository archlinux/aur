# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=peakPantheR
_pkgver=1.12.2
pkgname=r-${_pkgname,,}
pkgver=1.12.2
pkgrel=1
pkgdesc='Peak Picking and Annotation of High Resolution Experiments'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bslib
  r-doparallel
  r-dt
  r-foreach
  r-ggplot2
  r-gridextra
  r-lubridate
  r-minpack.lm
  r-msnbase
  r-mzr
  r-pracma
  r-scales
  r-shiny
  r-shinycssloaders
  r-stringr
  r-xml
)
optdepends=(
  r-biocstyle
  r-devtools
  r-faahko
  r-knitr
  r-msdata
  r-pander
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('be5fabaf60b964aad93252fd05aadef4463c22021c2febed285837524f78b739')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
