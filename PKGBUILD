# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PoiClaClu
_pkgver=1.0.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=10
pkgdesc="Classification and Clustering of Sequencing Data Based on a Poisson Model"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0b6a96b5e02ab7fcad913e7f6c538d12')
b2sums=('cb7d4b40d5e7d2250c653c4d4d5ce4513265cd4978d98228fb289ca80672eba8a860694031318650196617f82c06fe5e61a75d186368eebbb4161444492f0e3f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
