# system requirements: fftw3 (>= 3.3)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PoissonBinomial
_pkgver=1.2.7
pkgname=r-${_pkgname,,}
pkgver=1.2.7
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
sha256sums=('60cc429ec7180003f7a961015fa8392ac22785d1bbc3c3d31d3187367585616f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
