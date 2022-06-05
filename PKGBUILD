# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=assertive.matrices
_pkgver=0.0-2
pkgname=r-${_pkgname,,}
pkgver=0.0.2
pkgrel=4
pkgdesc='Assertions to Check Properties of Matrices'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertive.base
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3462a7a7e11d7cc24180330d48cc3067cf92eab1699b3e4813deec66d99f5e9b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
