# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=matrixTests
_pkgver=0.2.1
pkgname=r-${_pkgname,,}
pkgver=0.2.1
pkgrel=1
pkgdesc='Fast Statistical Hypothesis Tests on Rows and Columns of Matrices'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-matrixstats
)
optdepends=(
  r-car
  r-cosinor
  r-cosinor2
  r-moments
  r-nortest
  r-pmcmrplus
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0f21dcdf87fc6171423d7b5a0bd3aeec570e954de4aac2f2e14cc800cf8b4188')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
