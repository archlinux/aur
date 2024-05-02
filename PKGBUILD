# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BayesKnockdown
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Posterior Probabilities for Edges from Knockdown Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('574c6aa92ccbd8a7f3f312472a7ca605')
b2sums=('3f1396f52d04feb9f52ea502b7eff4394f366a74ac397070d460a70a755d87dbe86d7f39e760f7a2cc4778bb97d135dcb80be63c7af0f31bf98a7a21afd86878')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
