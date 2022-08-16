# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GENLIB
_pkgver=1.1.5
pkgname=r-${_pkgname,,}
pkgver=1.1.5
pkgrel=5
pkgdesc='Genealogical Data Analysis'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bootstrap
  r-doparallel
  r-foreach
  r-kinship2
  r-quadprog
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ca1d6201270c428f50615ed90efb781c9d60867c4b2a75d77a9e17f25dcb18e8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
