# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=KBoost
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Inference of gene regulatory networks from gene expression data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('654f49a9ec937c83c3e01655bb06acd4')
b2sums=('62fb85f92fe52ec9d5c75778e128ae68a78ae5d7f30ae8f30ba39e537773d37adbd0da3c31195d7b6242f2e30bc724c0d57757ea68a9e96a9c62c4fc9f096414')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
