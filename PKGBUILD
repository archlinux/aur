# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Cubist
_pkgver=0.4.0
pkgname=r-${_pkgname,,}
pkgver=0.4.0
pkgrel=4
pkgdesc='Rule- And Instance-Based Regression Modeling'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-reshape2
)
optdepends=(
  r-dplyr
  r-knitr
  r-mlbench
  r-modeldata
  r-rlang
  r-rmarkdown
  r-tidyrules
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3a1f74d44300e3a38a10e3693fc019cfcca221d62d7c416abebb20811e965578')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
