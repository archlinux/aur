# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=naivebayes
_pkgver=0.9.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="High Performance Implementation of the Naive Bayes Algorithm"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7f3467dcef693166e74c96ecd1b85d46')
b2sums=('0ffdf44e64864996ce52a8da30bd891022cf99e2c13465cf2e610eda86e75b43c861bb56bcf3e90a9feba215e1a44306078ebfae1e4cb6d6c79db2b11403ea01')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
