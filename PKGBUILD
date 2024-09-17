# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=ramcmc
_pkgver=0.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Robust Adaptive Metropolis Algorithm"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  r-rcpp
)
makedepends=(
  r-rcpparmadillo
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('30fee64ea786fecf9a8cd9446f5c8a89')
b2sums=('d067fbf69359f5c0fbb9a83a45b007f98b46d658c083ae33156c0b3a4e97df40a6462955d1ef27aaf770cafbda96e18afcb71026632c0fdd60a2b580d00a8e8a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
