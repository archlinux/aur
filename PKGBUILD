# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PRROC
_pkgver=1.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Precision-Recall and ROC Curves for Weighted and Unweighted Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-rlang
)
optdepends=(
  r-ggplot2
  r-rocr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('229140aa270cdad059daf08783b083bb')
b2sums=('5dfafbc8836d8620e68b7a64ff64b416b9362b920dd57e80910858b6c35078d469d4ec003054a99ff028015f8a469d9792f80d27926de3dd46eb5db54c6658ed')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
