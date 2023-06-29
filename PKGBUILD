# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=uwot
_pkgver=0.1.16
pkgname=r-${_pkgname,,}
pkgver=0.1.16
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
sha256sums=('5f63a0d9edddb08435477af52724cb588c787c8d543c68c9358ed7b1ec3e8e48')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
