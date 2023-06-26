# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=uwot
_pkgver=0.1.15
pkgname=r-${_pkgname,,}
pkgver=0.1.15
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
sha256sums=('b367f976febd30554fb730ef1ce43759e98a8c8e76b446be61acb6fd9bcb0b4e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
