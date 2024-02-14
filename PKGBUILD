# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=eegc
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Engineering Evaluation by Gene Categorization (eegc)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-annotationdbi
  r-clusterprofiler
  r-deseq2
  r-dose
  r-edger
  r-ggplot2
  r-gplots
  r-igraph
  r-limma
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-pheatmap
  r-r.utils
  r-s4vectors
  r-sna
  r-wordcloud
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('898230d2d6431f622202416e172d64e2')
b2sums=('fb0eb18232a94d8517531151d771fa36a03ed5a52e7ccee64f338a55397f8b3a26ad3a158ff7b0d4a25049e428f15d7fda5a8d839b265b8ccecd2bd081c17307')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
