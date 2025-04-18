# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=kebabs
_pkgver=1.42.0
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
md5sums=('c463444e1493087a1eb32988c27e3986')
b2sums=('14214646cfcf01cafb8002b85d75c2fc8e855c36eb13d7a58813196b204351dcd0bc7d9e4e7dcd6b7e4b45bb14efee736fd4eb960108b56b0b7a747813c4ac46')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
