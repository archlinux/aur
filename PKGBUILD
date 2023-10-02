# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=doBy
_pkgver=4.6.19
pkgname=r-${_pkgname,,}
pkgver=4.6.19
pkgrel=1
pkgdesc='Groupwise Statistics, LSmeans, Linear Contrasts, Utilities'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-broom
  r-deriv
  r-dplyr
  r-ggplot2
  r-magrittr
  r-microbenchmark
  r-pbkrtest
  r-tibble
)
optdepends=(
  r-geepack
  r-knitr
  r-lme4
  r-multcomp
  r-survival
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('db648cf187c28a61a9f18f008939448cf654affca8c994a19cb8aa9f1c5c1b92')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
