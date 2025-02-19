# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppDE
_pkgver=0.1.8
pkgname=r-${_pkgname,,}
pkgver=0.1.8
pkgrel=1
pkgdesc='Global Optimization by Differential Evolution in C++'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
  r-rcpparmadillo
)
optdepends=(
  r-deoptim
  r-inline
  r-lattice
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8e4a7916a387f06a96efeec77741113efbea5bdda2e065f4f782b536ef76191e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
