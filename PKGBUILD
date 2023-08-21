# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ExtDist
_pkgver=0.7-2
pkgname=r-${_pkgname,,}
pkgver=0.7.2
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
sha256sums=('d5e95a029cfa1288c3451dffff8222f21e77d77a128c29967cdd0a7db4ac2a73')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
