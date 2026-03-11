# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppDE
_pkgver=0.1.9
pkgname=r-${_pkgname,,}
pkgver=0.1.9
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
sha256sums=('f48aeea87e379beb1a408aef11d65c3f2b8ce09e97c2add6f42f9446ea92fe3b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
