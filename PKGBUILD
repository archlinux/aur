# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rpart.plot
_pkgver=3.1.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Plot 'rpart' Models: An Enhanced Version of 'plot.rpart'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-earth
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('868e285a433fbe5768fb255888e5e6c4')
b2sums=('a9ecf31428d372c572216a8e61fb2875c658a260fe745a3ded1c9b769d035f52893657422a4b5efb29822132a61ee2f4f2670a7be960929e961263839fc2c224')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
