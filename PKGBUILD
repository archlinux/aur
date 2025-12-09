# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=knitrBootstrap
_pkgver=1.0.4
pkgname=r-${_pkgname,,}
pkgver=1.0.4
pkgrel=1
pkgdesc="'knitr' Bootstrap Framework"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-knitr
  r-markdown
  r-rmarkdown
)
optdepends=(
  r-corrplot
  r-ggplot2
  r-igraph
  r-mapproj
  r-maps
  r-maptools
  r-plyr
  r-reshape2
  r-roxygen2
  r-testthat
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fbc1e8df2f9b17139d1156a17b890f3a50d356701862227981535ca50a21838a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
