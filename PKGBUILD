# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=uwot
_pkgver=0.2.4
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
md5sums=('4a72402e9d5217e4f57f3166aeaca8db')
b2sums=('eb754ea06862c261781fd13a19f75b45ce225b4b073d6df79a54bf7c3746775fa2d85a0704b777d16baef8271792b263cede64242e592744d4f2d6538f1e3785')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
