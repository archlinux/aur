# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=bestNormalize
_pkgver=1.8.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
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
sha256sums=('70d677c5241d242d304dc88c3033e532fffcd4933df67b8ba5614cd3b709ff80')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
