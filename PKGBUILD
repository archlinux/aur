# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=uwot
_pkgver=0.2.1
pkgname=r-${_pkgname,,}
pkgver=0.2.1
pkgrel=1
pkgdesc='The Uniform Manifold Approximation and Projection (UMAP) Method for Dimensionality Reduction'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-dqrng
  r-fnn
  r-irlba
  r-rcpp
  r-rcppannoy
  r-rcppprogress
)
optdepends=(
  r-bigstatsr
  r-covr
  r-rspectra
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6cdf2784d53d2de74aba92b82f8a41b27b6bcf98e549c31e88006352fb0ce2bd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
