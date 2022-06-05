# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=arsenal
_pkgver=3.6.3
pkgname=r-${_pkgname,,}
pkgver=3.6.3
pkgrel=4
pkgdesc="An Arsenal of 'R' Functions for Large-Scale Statistical Summaries"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-knitr
)
optdepends=(
  r-broom
  r-coin
  r-geepack
  r-magrittr
  r-mass
  r-pander
  r-proc
  r-rmarkdown
  r-rpart
  r-splines
  r-survival
  r-testthat
  r-xtable
  r-yaml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bace6e1cf66574db8edb142a2cc4f81feda511e612c3f69e955636241a1d7a63')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
