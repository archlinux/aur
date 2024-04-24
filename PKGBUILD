# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CircStats
_pkgver=0.2-6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
pkgdesc="Circular Statistics, from \"Topics in Circular Statistics\" (2001)"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d298b902e4d55adbff7ac7781ff0fde9')
b2sums=('23964ab1febbe7022c0337933233fe4c32d8baee778e2e6cae0349b91423156be949727d7f2c4956677d049af6ca873febc84d9d4c78d04e77d4e8efe18b9e23')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
