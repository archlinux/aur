# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MatrixCorrelation
_pkgver=0.10.0
pkgname=r-${_pkgname,,}
pkgver=0.10.0
pkgrel=5
pkgdesc='Matrix Correlation Coefficients'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-plotrix
  r-pracma
  r-progress
  r-rcpp
  r-rcpparmadillo
  r-rspectra
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7e3d1af2c0436b0ee1ee2b759a7d05b989ce48da43c9847b60a7489a59f043d9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
