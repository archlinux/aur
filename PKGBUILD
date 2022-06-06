# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=origami
_pkgver=1.0.5
pkgname=r-${_pkgname,,}
pkgver=1.0.5
pkgrel=4
pkgdesc='Generalized Framework for Cross-Validation'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-assertthat
  r-data.table
  r-future
  r-future.apply
  r-listenv
)
optdepends=(
  r-class
  r-forecast
  r-glmnet
  r-knitr
  r-randomforest
  r-rmarkdown
  r-stringr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8d0d08aaecc428cbbf5db4615ad3623777c10c6d7947a1cc3ccc7f8db8cb5263')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
