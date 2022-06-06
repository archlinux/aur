# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.sparse
_pkgver=2.1-1
pkgname=r-${_pkgname,,}
pkgver=2.1.1
pkgrel=7
pkgdesc='Sparse Three-Dimensional Arrays and Linear Algebra Utilities'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-spatstat.utils
  r-tensor
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9a35ad69715b767b3ae60b02dce05ccf108fcccdf95bbc8f7d02557bcbde7303')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
