# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=kebabs
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Kernel-Based Analysis of Biological Sequences"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-apcluster
  r-biostrings
  r-e1071
  r-kernlab
  r-liblinear
  r-rcpp
  r-s4vectors
  r-xvector
)
makedepends=(
  r-iranges
)
optdepends=(
  r-biobase
  r-biocgenerics
  r-knitr
  r-sparsem
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('52303b34ec01fab69fb9e3766af6641d')
b2sums=('60a7bfaa02c741e799fa0d345f2555ed7e9c5d05b3a4b2ac4f2db9415ba34c65bc0bf172a73f23fc06ff8c3921f1dc7bf048000fa16af0af8e6495fb7d983f29')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
