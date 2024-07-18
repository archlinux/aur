# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CpGassoc
_pkgver=2.70
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Association Between Methylation and a Phenotype of Interest"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d9c706b591f6070c27038e40235d6e44')
b2sums=('bd6a634d53ff5a43ed490ad61b9679d0817b9304e4fb9161b1acceaa69062a3557d852efdfb3662603f1768f2ae61641dc2d1db440d5f676b5ef3215b4aa0718')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
