# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LEA
_pkgver=3.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="an R package for Landscape and Ecological Association Studies"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  lapack
  r
)
optdepends=(
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7719ef04debd69cbf7bf09b0b0966ee0')
b2sums=('dd0846da89e53337d26bbc2f88349d3843c77bf21f0303f04c3113188a66f70353aee12e6b897efcdc703684f66ebe3df9b91f78bc5fa43efa4a576a51da10db')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
