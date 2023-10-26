# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EBSeq
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for gene and isoform differential expression analysis of RNA-seq data"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-blockmodeling
  r-gplots
  r-rcpp
  r-rcppeigen
  r-testthat
)
makedepends=(
  r-bh
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e64aabb38197aba0ee5985a1558cce60')
sha256sums=('9c5818ed988a1b3e416f3300ad56d4ae778485deb3b51eb6ee31bea91074a91f')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
