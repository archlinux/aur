# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GoFKernel
_pkgver=2.1-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=10
pkgdesc="Testing Goodness-of-Fit with the Kernel Density Estimator"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2874ad08b0f92ea2f286e1f812881755')
b2sums=('e952063c4d9afb72fe43190d2463a7a02758af29f227e08bbb9c4d9e14fa37c5f16abf78b1e0095c15ec539898dfecddf354bda626a5d11708d9dae09f182b42')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
