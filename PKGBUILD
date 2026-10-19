# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DirichletReg
_pkgver=0.7-4
pkgname=r-${_pkgname,,}
pkgver=0.7.4
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
sha256sums=('9443f3d132156c436f0c8b9ce925e82b3105455ac917bd3a59da4c8f63a2b431')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
