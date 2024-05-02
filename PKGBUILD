# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rSWeeP
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Functions to creation of low dimensional comparative matrices of Amino Acid Sequence occurrences"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-pracma
)
optdepends=(
  r-biocstyle
  r-biostrings
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dfe965b29c7e198551077a112a2c5d82')
b2sums=('0ff589e6114fca75c3dbe197c237d9f86e66cd73807206f5ebea23662a5e9ae2c594a888ac157e04f2b66cbac1304c3beece81c44b1dc543634e3edcb97af1bc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
