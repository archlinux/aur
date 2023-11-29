# system requirements: fftw3 (>= 3.3)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PoissonBinomial
_pkgver=1.2.6
pkgname=r-${_pkgname,,}
pkgver=1.2.6
pkgrel=1
pkgdesc='Efficient Computation of Ordinary and Generalized Poisson Binomial Distributions'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
  fftw
)
optdepends=(
  r-knitr
  r-microbenchmark
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5020f3eb38cfea7fbfd4082df96503e23dee3fa0e12ce8468688ba61feace7bc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
