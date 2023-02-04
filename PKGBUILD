# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=compositions
_pkgver=2.0-5
pkgname=r-${_pkgname,,}
pkgver=2.0.5
pkgrel=1
pkgdesc='Compositional Data Analysis'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bayesm
  r-robustbase
  r-tensora
)
optdepends=(
  r-combinat
  r-energy
  r-knitr
  r-rgl
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a1b84b23f3fa5d7793318a6b6ad44f50b9653efccfb753a5952ccb11d1662c5a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
