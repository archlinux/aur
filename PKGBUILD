# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aws
_pkgver=2.5-4
pkgname=r-${_pkgname,,}
pkgver=2.5.4
pkgrel=1
pkgdesc='Adaptive Weights Smoothing'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-awsmethods
  r-gsl
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6d93741e649cc7bddcdccc0fe87f02cb8b79d7e70a95e60891c58b49b51d49ef')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
