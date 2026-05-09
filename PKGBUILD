# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=sftime
_pkgver=0.3.2
pkgname=r-${_pkgname,,}
pkgver=0.3.2
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
sha256sums=('5638d00fd4e54ef765e0cfc6c984a0b3b5d5cda74153258af91e350d1dbd9f4d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
