# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BlandAltmanLeh
_pkgver=0.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Plots (Slightly Extended) Bland-Altman Plots"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-ggextra
  r-ggplot2
  r-knitr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('50d200b7bd2d9634112aaa9e49effd2d')
b2sums=('753dac0088861100f1aab4aa5d1728ac360b2527c33d6178880c6c39319415ca4050246943ab7c037109d50dac891d053f391d85d04b8e7dfe2eaccbd5cb1475')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
