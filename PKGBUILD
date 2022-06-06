# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppDE
_pkgver=0.1.6
pkgname=r-${_pkgname,,}
pkgver=0.1.6
pkgrel=3
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
sha256sums=('c9386709f72cdc33505b3ac675c173013fe098434b7c21bc09eb625b529132c5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
