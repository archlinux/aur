# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gridBase
_pkgver=0.4-7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Integration of base and grid graphics"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6d5064a85f5c966a92ee468ae44c5f1f')
b2sums=('0a70553cf1bd1765e97c4161a59e7df36a861df83cfd6b756e6f558319da15911ebab865e912dbc748c1d61c4c120349e372f54ec0cee65392aa48eded704ba1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
