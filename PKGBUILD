# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=elasticnet
_pkgver=1.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Elastic-Net for Sparse Estimation and Sparse PCA"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-lars
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6cbe6a3a3828656bc331b2f0181a3ca1')
b2sums=('5cd58bb9dc455ff60c68b6b0c6cc376a59c1a9c1e07bad8e43717fb12ed357c5b8bbba219ed3a2032c0aa132d0d640c72f12dc509feed1e309e1a0cd67f6e21d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
