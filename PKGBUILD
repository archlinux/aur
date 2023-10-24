# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.sparse
_pkgver=3.0-3
pkgname=r-${_pkgname,,}
pkgver=3.0.3
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
sha256sums=('6bbc4e42ae71eece63e8c3e390068a84eeeb6cd4f6bdb555d8815aa2ed988d69')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
