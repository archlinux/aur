# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=KBoost
_pkgver=1.18.0
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
md5sums=('2890fdc97332a57a35f46ff59a9b7918')
b2sums=('ecfc2a961212568922be520d26d608ebfdcc76a29ad7c9fcf27362ad291dd785124a2f7ce7e394efb841cb614c15c5c073fd8d85c23f0298a974653d14fd7f85')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
