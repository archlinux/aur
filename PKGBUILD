# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.sparse
_pkgver=3.0-1
pkgname=r-${_pkgname,,}
pkgver=3.0.1
pkgrel=1
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
sha256sums=('2c1cf0ddad366aa4230bd03241a1ef87ed635f53a6943fc4a6c2d371626d0d1c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
