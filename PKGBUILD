# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=uwot
_pkgver=0.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The Uniform Manifold Approximation and Projection (UMAP) Method for Dimensionality Reduction"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-fnn
  r-irlba
  r-rcpp
  r-rcppannoy
  r-rspectra
)
makedepends=(
  r-dqrng
  r-rcppprogress
)
optdepends=(
  r-bigstatsr
  r-covr
  r-knitr
  r-rcpphnsw
  r-rmarkdown
  r-rnndescent
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('57fb04692b7dd13e9ca1b333d3c09722')
b2sums=('8c0067d00984507c82103a89488c152e8a5f433d8e4aa0a73dbb45a284b940079ca5e98081ea97d12efc46eadbdb2f60af30be55fb04acea48abb4149832b886')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
