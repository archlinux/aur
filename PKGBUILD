# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rSWeeP
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('42d80dcf3d267562e175115cdfd4c731')
b2sums=('2cbc05201b6142dafedc0997ef06e04d1fb2a6fd0b138ff372a0d31c6c35a71c7e0bd48d34b515a9d4054468e45dc210c2827760e7e11d9c9492ab00ee62832b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
