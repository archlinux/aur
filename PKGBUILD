# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRNApath
_pkgver=1.66.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Pathway Enrichment for miRNA Expression Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.1-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('52bfe4f43f6707c465da3e1fb4fe4ff4')
b2sums=('706bcd4b98f95ee572f492d29fefa82a6f83ea79d31542e6d679eec67391a394195c904a6c813235ee512db9acddf39b4ffac7992d7997cb932ee62eaabd141e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
