# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SEPIRA
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Systems EPigenomics Inference of Regulatory Activity"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-corpcor
  r-limma
)
optdepends=(
  r-igraph
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c7ed46a5810d2e91210561758428a7fb')
b2sums=('c29ec1fec144374cea25210d248323d1bd3492eae239a20e5f47abc62632b7ecdc4ca9a3dc1bbb8f6394920bf744a7105364af88bcd3ad313b8e02009883518a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
