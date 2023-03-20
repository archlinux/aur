# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=bestNormalize
_pkgver=1.9.0
pkgname=r-${_pkgname,,}
pkgver=1.9.0
pkgrel=3
pkgdesc='Normalizing Transformation Functions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-butcher
  r-doparallel
  r-dorng
  r-dplyr
  r-foreach
  r-generics
  r-lambertw
  r-nortest
  r-purrr
  r-recipes
  r-tibble
)
optdepends=(
  r-covr
  r-ggplot2
  r-knitr
  r-mass
  r-mgcv
  r-parallel
  r-rlang
  r-rmarkdown
  r-scales
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ed8dbcb63e45d5a30e5752709cbad54777815dc0cec215f770ae10ccd51ae04f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
