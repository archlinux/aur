# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bcSeq
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast Sequence Mapping in High-Throughput shRNA and CRISPR Screens"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biostrings
  r-rcpp
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8628fcba235199af4969c5fa6912e8db')
b2sums=('d82e32aed8e831fcd441f6969c41fa643c53077f99da496688ab7330eb18413977fb4f97e50bce542a09308598f9702e5c314f594dcd95d73495d0e7bce6d43f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
