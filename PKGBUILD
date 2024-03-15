# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=elitism
_pkgver=1.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Equipment for Logarithmic and Linear Time Stepwise Multiple Hypothesis Testing"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('424762eec20ce983d5f5a24fa7af4f57')
b2sums=('8e2ac1d8ea8b9b5c13d0d57ad5c7339c4694764a45f16436441b04da523794166edea89235aabb602d9b6eadbe59604f28279b3d3a4f73abbb1ef162907e9a6f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
