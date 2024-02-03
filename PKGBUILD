# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AdaptGauss
_pkgver=1.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Gaussian Mixture Models (GMM)"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-datavisualizations
  r-plotly
  r-pracma
  r-rcpp
  r-shiny
)
optdepends=(
  r-dqrng
  r-foreach
  r-ggplot2
  r-knitr
  r-mclust
  r-paralleldist
  r-reshape2
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('54c3fc08f481c0cd2a09a937918c6bf4')
b2sums=('e2719335954f4b5bc44100c40b3d686f749d17b0f615a23c8b78c5567ba70994d15efb22ae1ac583af96a18a33eafc605370e8041aabfec7909957fbbc02bdb0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
