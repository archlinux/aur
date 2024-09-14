# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=sftime
_pkgver=0.3.0
pkgname=r-${_pkgname,,}
pkgver=0.3.0
pkgrel=1
pkgdesc='Classes and Methods for Simple Feature Objects that Have a Time Column'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Apache')
depends=(
  r
  r-sf
)
optdepends=(
  r-dplyr
  r-ggplot2
  r-knitr
  r-magrittr
  r-ncmeta
  r-rlang
  r-rmarkdown
  r-sp
  r-spacetime
  r-stars
  r-tidyr
  r-trajectories
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('adadd4d5f6ef388b7145d83896fcc020ad03475eae9d86a100d6207611ded7b7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
