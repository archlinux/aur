# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scrime
_pkgver=1.3.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=10
pkgdesc="Analysis of High-Dimensional Categorical Data Such as SNP Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-dbi
  r-oligoclasses
  r-rsqlite
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('af5e1df2574e2ce52b4a59aadf25eb49')
b2sums=('5ad1c4b68eb69bc3058948a8cc788ace89583c62b0f0b7c309365655c7b8f64c993eeb1dac31e1abecdc1b99d7c0062be728c5730f3e42acf1683fb115bbdbe7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
