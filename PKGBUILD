# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EBSeq
_pkgver=2.4.0
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
md5sums=('31e2325303d52aadc8a034eec7cab8cd')
b2sums=('d913d31bff9b7037fc65f1d4a2bcae6d3755b87cbe78f18d48fea23302e602e850285cdda1c33004ef397631ad5f0ec79248ccccef9e576f53ffcb25c6d4df70')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
