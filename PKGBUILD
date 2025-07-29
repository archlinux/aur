# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MatrixCorrelation
_pkgver=0.10.1
pkgname=r-${_pkgname,,}
pkgver=0.10.1
pkgrel=1
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
sha256sums=('aedafd58eb6f021393191c9cb4ad919003bda0fe8e2fcd598c7753f7a747344e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
