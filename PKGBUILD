# system requirements: C++11, GNU make, Windows: cmd.exe and cscript.exe
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rPref
_pkgver=1.3
pkgname=r-${_pkgname,,}
pkgver=1.3
pkgrel=4
pkgdesc='Database Preferences and Skyline Computation'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-igraph
  r-lazyeval
  r-rcpp
  r-rcppparallel
)
optdepends=(
  r-ggplot2
  r-graph
  r-knitr
  r-rgraphviz
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('de285d93cd979fcbec5f372303de64d06c8e8611dc495d02e0cf74e160879f6e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
