# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EBSeq
_pkgver=2.6.0
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
  r-bh
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f0be7deaf336818f3933addbbe66809e')
b2sums=('0e1d2f7c3c41cc17cc6afb84a30a76b461691ab6cb3b3e11d56c97e9f28766ec4898a2ffbe8ba2622f3f656cb0feab07c4e815de11296c1484b0a6902ba39ca4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
