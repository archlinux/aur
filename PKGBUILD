# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=doBy
_pkgver=4.6.17
pkgname=r-${_pkgname,,}
pkgver=4.6.17
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
sha256sums=('c58a944a3b87b2575dcaf319875bea8c5a47513dddbdabf8dfabea9cc20f4b0a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
