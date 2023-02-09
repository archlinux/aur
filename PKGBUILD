# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Cubist
_pkgver=0.4.2
pkgname=r-${_pkgname,,}
pkgver=0.4.2
pkgrel=1
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
sha256sums=('35b6d1d299720175ff65535c324ce884daee6f9aae0ee414dccd9e554f4a5dcf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
