# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qqconf
_pkgver=1.2.3
pkgname=r-${_pkgname,,}
pkgver=1.2.3
pkgrel=3
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
sha256sums=('9b5b6042ea8e52e6e049807c0b5e3bfd534b624bd257be769de69cf505fece62')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
