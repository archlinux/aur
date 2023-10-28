# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=methylclock
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Methylclock - DNA methylation-based clocks'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biobase
  r-devtools
  r-dplyr
  r-dynamictreecut
  r-experimenthub
  r-ggplot2
  r-ggpmisc
  r-ggpubr
  r-gridextra
  r-impute
  r-methylclockdata
  r-minfi
  r-performanceanalytics
  r-planet
  r-preprocesscore
  r-quadprog
  r-rcpp
  r-rpmm
  r-tibble
  r-tidyr
  r-tidyverse
)
optdepends=(
  r-biocstyle
  r-geoquery
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('813248b3f4cabf05919de15147630e8290984f0bdce177de4445ed6683a85eda')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
