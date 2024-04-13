# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SEPIRA
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e0d410ec6e6a43ff9e8c88eabc714a95')
b2sums=('cc081507d2b8ae2ce0725d5dd1be35f46a60b3a2c94965f197e7cc2acb56c98075cb5b94df6c405fc46b0e642131c8838220927a9b3fde0066fec3d4573e9001')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
