# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=naivebayes
_pkgver=0.9.7
pkgname=r-${_pkgname,,}
pkgver=0.9.7
pkgrel=4
pkgdesc='High Performance Implementation of the Naive Bayes Algorithm'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-knitr
  r-matrix
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4fe9e5e947faaa3cbec14ae3db1cb6dfbf90e0dee89975d5727869881a3a151c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
