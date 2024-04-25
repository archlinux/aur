# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EBSeq
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="An R package for gene and isoform differential expression analysis of RNA-seq data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
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
b2sums=('19701db5e1113e452d5e1f2537f2ca000b8d703ce935427336251e2038d3dc1dcff9d9c576b789352f280e146d428ad0449a4fa38957e82250287d35860c95f6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
