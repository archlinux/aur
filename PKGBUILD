# system requirements: A POSIX system. Currently Linux and OS X are knownto work. GNU make.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PRIMME
_pkgver=3.2-3
pkgname=r-${_pkgname,,}
pkgver=3.2.3
pkgrel=1
pkgdesc='Eigenvalues and Singular Values and Vectors from Large Matrices'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
  make
)
optdepends=(
  r-matrix
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('052c606d7648a4de5b94836e2c410a52cd1562f5cf660cb9351bd9e7b1643705')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
