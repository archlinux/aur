# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EBarrays
_pkgver=2.66.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Unified Approach for Simultaneous Gene Clustering and Differential Expression Identification"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d273e2e9411207653d4e079e14484026')
b2sums=('e7ee39ac298e4fbfe93b83c5e11eafd0dd661d81d967586605a1b35d89309a839b5ed46a6922f8a4468bb40e617a88aa5297e04bc4ebc552ea931ff16999a1d8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
