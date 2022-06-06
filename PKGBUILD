# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=uwot
_pkgver=0.1.11
pkgname=r-${_pkgname,,}
pkgver=0.1.11
pkgrel=4
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
  r-rspectra
)
optdepends=(
  r-bigstatsr
  r-covr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4fcf90f1369a2a1f01db9e05a2365b155b2ada8e51e1f7f3ba5122d86affd41b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
