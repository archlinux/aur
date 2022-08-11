# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qqconf
_pkgver=1.3.0
pkgname=r-${_pkgname,,}
pkgver=1.3.0
pkgrel=1
pkgdesc='Creates Simultaneous Testing Bands for QQ-Plots'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-distr
  r-dplyr
  r-ggplot2
  r-magrittr
  r-rlang
  r-robustbase
  r-rcpp
  fftw
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1c42ab81403568f3ad53217cc85190dad7c2fae957bfd0f0f30d57be0a065087')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
