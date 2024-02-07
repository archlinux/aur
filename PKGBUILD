# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=knitrBootstrap
_pkgver=1.0.3
pkgname=r-${_pkgname,,}
pkgver=1.0.3
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
sha256sums=('ad6a23f236af6cf804aa7595f4dca5fdd54cbdc86d97b2028f4eb6539fb0f594')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
