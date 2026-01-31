# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=stabs
_pkgver=0.7-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Stability Selection with Error Control"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-gamboostlss
  r-glmnet
  r-hdi
  r-knitr
  r-lars
  r-mboost
  r-rmarkdown
  r-testthat
  r-th.data
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('98c6d1e9b8f856d3e500e4d69b9c03f7')
b2sums=('460998c9f1950ac2305a5b695265a3943aabec746e3f59168804b27c4f7fcad6b4689683a5d4db0239be0f08b3f32190cc54601698b678adca13c98516003e4f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
