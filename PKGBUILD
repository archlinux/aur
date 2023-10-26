# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=directlabels
_pkgver=2023.8.25
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='Direct Labels for Multicolor Plots'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-quadprog
)
optdepends=(
  r-alphahull
  r-dplyr
  r-ggplot2
  r-ggthemes
  r-inlinedocs
  r-knitr
  r-lars
  r-lattice
  r-latticeextra
  r-markdown
  r-mass
  r-nlme
  r-rcolorbrewer
  r-rlang
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('12dd1d50f73876cc1919652f4c98facc77e063d3e03c7b256e8bfbbd3dd0ea5c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
