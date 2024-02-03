# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cobs
_pkgver=1.3-7
pkgname=r-${_pkgname,,}
pkgver=1.3.7
pkgrel=1
pkgdesc='Constrained B-Splines (Sparse Matrix Based)'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-quantreg
  r-sparsem
)
optdepends=(
  r-matrix
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('33dda6cf6e97ddedbd91b6b3e7cbeec08cda84200cb37c3e7875bacd348ae63f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
