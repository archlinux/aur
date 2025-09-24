# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ExtDist
_pkgver=0.7-4
pkgname=r-${_pkgname,,}
pkgver=0.7.4
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
sha256sums=('de57cfededee9a5b8ef9c7eb628b9191c2b61c66ab7ac92b5f80b35c6533cf22')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
