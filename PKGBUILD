# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=irlba
_pkgver=2.3.5
pkgname=r-${_pkgname,,}
pkgver=2.3.5
pkgrel=4
pkgdesc='Fast Truncated Singular Value Decomposition and Principal Components Analysis for Large Dense and Sparse Matrices'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('26fc8c0d36460e422ab77f43a597b8ec292eacd452628c54d34b8bf7d5269bb9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
