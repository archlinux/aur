# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geoscale
_pkgver=2.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Geological Time Scale Plotting"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fb8f89a553c5f4495ccccf243ae10e14')
b2sums=('05a972e6907ea0016e72edc63d9bcd88245961de64302850d06697ef05b70074cb350cba48081ff3b61c4f8b09a2cd3c3b030e749297c68a273fa2cb36cf3c46')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
