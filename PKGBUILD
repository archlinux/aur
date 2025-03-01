# system requirements: pandoc (https://johnmacfarlane.net/pandoc) forexporting markdown files to other formats.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pander
_pkgver=0.6.6
pkgname=r-${_pkgname,,}
pkgver=0.6.6
pkgrel=1
pkgdesc="An R 'Pandoc' Writer"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('AGPL')
depends=(
  r
  r-digest
  r-rcpp
  pandoc
)
optdepends=(
  r-data.table
  r-descr
  r-epi
  r-forecast
  r-ggplot2
  r-grid
  r-gtable
  r-knitr
  r-lattice
  r-logger
  r-mass
  r-memisc
  r-microbenchmark
  r-nlme
  r-randomforest
  r-reshape
  r-rmarkdown
  r-rms
  r-survival
  r-sylly
  r-sylly.en
  r-tables
  r-tseries
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8041e6b40c0212286f35020a11db180823fe1cb709f1d88ad657f28455692ade')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
