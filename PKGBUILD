# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=intervals
_pkgver=0.15.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Tools for Working with Points and Intervals"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3ae67facc1528d3626057793aa553924')
b2sums=('e77edfab823a5c06345f631832ac2b7174ce7eb7153d3eaccd40414034c853959b1c2d5bd54bb39177a68b6f51e1fc423f55e12560a131bbd4f43b357498c110')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
