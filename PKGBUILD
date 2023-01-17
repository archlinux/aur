# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ExtDist
_pkgver=0.7-1
pkgname=r-${_pkgname,,}
pkgver=0.7.1
pkgrel=1
pkgdesc='Extending the Range of Functions for Probability Distributions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-numderiv
  r-optimx
)
optdepends=(
  r-ggplot2
  r-graphics
  r-knitr
  r-performanceanalytics
  r-rmarkdown
  r-stats
  r-suppdists
  r-truncdist
  r-utils
  r-vgam
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f80079786d01e01d7b1a546653730c6e895dd7330a98b66d7ab1b5f453eb7128')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
