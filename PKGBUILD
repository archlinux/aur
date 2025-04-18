# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LungCancerACvsSCCGEO
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A lung cancer dataset that can be used with maPredictDSC package for developing outcome prediction models from Affymetrix CEL files"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8bffc31ebaba11fbe2a955a6ab47d6e9')
b2sums=('e175aaf7cd479210a4b5cb3157b203251b8233ce1388b083bb892536d6e1a7591e0774644a4403995a0eec7a9c7f15cf50f43bae4f56855e3866983e8a2ebbbe')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
