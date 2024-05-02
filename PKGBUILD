# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EBSeq
_pkgver=2.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('ce22c564c9d4046e4fb2f7a552a572be')
b2sums=('a7ec6b1ffb8f6bece2bdca04f9d775148cf0b5acf5dadf69aef01b04f36e889980afe31a20bb4d099c821896919c8cfe43509050feb5f39d918083f244ee8843')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
