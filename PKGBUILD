# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=locfdr
_pkgver=1.1-8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
pkgdesc="Computes Local False Discovery Rates"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d4ee3349e9cb39b70bfff94ff665d2aa')
b2sums=('7dd22100014c830e53bf192f4cc82d5216f53b97d6db3394f9ab0234e5f36566f295196e9211351422cca9b562a36b23fc9a8cfd440ee5333b48c4aaa08872bc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
