# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DirichletReg
_pkgver=0.7-2
pkgname=r-${_pkgname,,}
pkgver=0.7.2
pkgrel=1
pkgdesc='Dirichlet Regression'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-formula
  r-maxlik
)
optdepends=(
  r-formatr
  r-knitr
  r-rgl
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('088b4c8cf4c87e661c741a87791f8bbbbe55175d76d4ed0a7b24e7fe76782d9b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
