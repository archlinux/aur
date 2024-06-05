# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geneLenDataBase
_pkgver=1.40.1
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
md5sums=('a5b4f62fdd6d45a9f8e59575266961cc')
b2sums=('9d6ff9321b46df6836e618d4c52a47b2c2bce89818fa54c3b549a3e280208ca197fabf15c3ae9629322e357a3507962939ba8f12ce116ad1f1afa8dbc19db4ac')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
