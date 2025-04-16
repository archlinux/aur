# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nuCpos
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for prediction of nucleosome positions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-biostrings
  r-nupop
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('11fc7aeeecf848fff45fd634dc1556cc')
b2sums=('9cb46b7de7fe27af4f83b1a2276d71b96c85984431ef56d60f7ce56ab282d968d5a6774b2dcd2be30e05c3a65ef30dea64aa4790b88b5530b6d3af012ebccc71')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
