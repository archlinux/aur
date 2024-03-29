# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=KBoost
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('853c93af3367a8af56b60aea8495f44b')
b2sums=('90e22d4770056298a98d2554cdf6cfaf5918d971e6ddbb96ea1b0e7cf21666c2e5a0cc4fd50a4d3708bc6489fe7dba9268a0df25bebd0772dab6d076ccdef0a5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
