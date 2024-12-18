# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geneLenDataBase
_pkgver=1.42.0
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
md5sums=('383f08d23aa5b28f812f4d353bc5dd6f')
b2sums=('8c2a0dae7e745e9dab53c12a8072d3b9a955bf8d5edfdefdaba34152985349420063a6ff8b1f33148506b5a5fe290eea122eacd2b9bd96b95c39d12b68819bc1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
