# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=speaq
_pkgver=2.7.0
pkgname=r-${_pkgname,,}
pkgver=2.7.0
pkgrel=6
pkgdesc='Tools for Nuclear Magnetic Resonance (NMR) Spectra Alignment, Peak Based Processing, Quantitative Analysis and Visualizations'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Apache')
depends=(
  r
  r-data.table
  r-dosnow
  r-foreach
  r-ggplot2
  r-gridextra
  r-impute
  r-massspecwavelet
  r-missforest
  r-reshape2
  r-rfast
  r-rvest
  r-xml2
)
optdepends=(
  r-datasets
  r-grid
  r-gridbase
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('93d665e3310507bd78d14346461eb9f260b945420f1a0612b8f07ee5961d2a7d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
