# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=colorRamps
_pkgver=2.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=6
pkgdesc="Builds Color Tables"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('854cb46c9d7f15cc41890ef817b23f6b')
b2sums=('a4bbff033c9b02c2e0389fadc431c2720f065854672111ce937bbb034c0cfd3410bb163ae8ef074b00be7cc887b61d3b01ba9864ec36d48d91633f75fd0731b0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
