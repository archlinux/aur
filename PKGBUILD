# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=cointReg
_pkgver=0.2.0
pkgname=r-${_pkgname,,}
pkgver=0.2.0
pkgrel=2
pkgdesc='Parameter Estimation and Inference in a Cointegrating Regression'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-checkmate
  r-matrixstats
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('84b7a3ad15f99c8d4993f689410833a99f2acad1827ddc64ae99c2ad12409a58')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
