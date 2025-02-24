# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=uwot
_pkgver=0.2.3
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
md5sums=('62b3c53b64bc841664db019f59362ef3')
b2sums=('73a91bbb9c51f4c82a74b7bd9cb9856214d9560721eb5cb0340a83259f76b3f2fec516e25607295cb96b0461dddecf79ae424516e57d202b1005d5471c0cf7e8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
