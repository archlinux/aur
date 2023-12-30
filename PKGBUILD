# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=randtests
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=6
pkgdesc="Testing Randomness in R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a0fb51dea0ad222e57f10c703f84552c')
b2sums=('c06a4885aca05e82f8ef664095d18adeab5be4ca7370cdcd3f2897005e793cc33b8fae55b5a0ebeb11d326d92deaa8117b3d96a028eab79a12c469c9a64717eb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
