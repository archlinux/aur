# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=distances
_pkgver=0.1.13
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for Distance Metrics"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('69dc1380c11a91591642c5647b48db42')
b2sums=('93de3748e0e48bb3e3161cf2d59521f1be426d62d1a9b16127f109921e1e51616206ba1bffdde2d659f5fd0e764ce913909b92048e8613f023e327e6bf438f3c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
