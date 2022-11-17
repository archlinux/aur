# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GENLIB
_pkgver=1.1.6
pkgname=r-${_pkgname,,}
pkgver=1.1.6
pkgrel=1
pkgdesc='Genealogical Data Analysis'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bh
  r-bootstrap
  r-doparallel
  r-foreach
  r-kinship2
  r-quadprog
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f686074dec99e5d775e44d7e4926d945f8725fd7f00a16d7d558d275c14e928c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
