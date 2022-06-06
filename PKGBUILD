# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=stabs
_pkgver=0.6-4
pkgname=r-${_pkgname,,}
pkgver=0.6.4
pkgrel=4
pkgdesc='Stability Selection with Error Control'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-gamboostlss
  r-glmnet
  r-hdi
  r-knitr
  r-lars
  r-mboost
  r-rmarkdown
  r-testthat
  r-th.data
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f8507337789f668e421a6ee7b11dd5ea331bf8bff0f9702dd1b93f46c2f3c1d9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
