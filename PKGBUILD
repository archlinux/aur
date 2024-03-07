# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=AUC
_pkgver=0.3.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=10
pkgdesc="Threshold Independent Performance Measures for Probabilistic Classifiers"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4a1e66f9889fc2fe02c734e1e1fd063f')
b2sums=('82a25634128fb69f1ad63f7fbff7d00c91ec8769fc7c6c26ac496fbf874b6be932cee67ebd84293fd4c6333863a9ecc9123e5d639661702be749a41a7b150757')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
