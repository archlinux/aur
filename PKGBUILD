# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=uwot
_pkgver=0.2.5
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
md5sums=('194ecf9261ba79778bca5f2751dcec11')
b2sums=('c9d4a328d2d98e177fe28f7a16f0643ebbc90a52fdd827e603dc8c6cbddbfb261b7b54cd110cac85de91bf8cb1b0f1acbdbe2808f257259e84749a00fc60927d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
