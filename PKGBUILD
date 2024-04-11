# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qqman
_pkgver=0.1.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Q-Q and Manhattan Plots for GWAS Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-calibrate
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('af41e4fe81ff4b26cd9d69e70c31a8df')
b2sums=('1b41c01fea625e02c8a33b48ac3438950dac67ade665d64864be3fc33850be039567be03baed6538a421881d36f7dc73e1ed3de4ae72e19e7207f7a7388db1fd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
