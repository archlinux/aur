# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geneLenDataBase
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Lengths of mRNA transcripts for a number of genomes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r-genomicfeatures
  r-rtracklayer
  r-txdbmaker
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2cbbbe5b80627b6a1bd4b997fd25409c')
b2sums=('866559db7ea26f577f18d7ebb00327d438d8fde1993ffd66ce219ded404a46fbfab3a9ddc13f1bbbf0cac8fcf7e4aeaca3fc5d11eb18440507c9800555f41815')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
