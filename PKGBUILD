# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=eegc
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b454926a77b06904f3560f0c28ee1299')
b2sums=('2b020a24244315e197880675a85af2d618cb2c7384b2b7d9c30412e64e52ad806028dcfa45c7def4a2378e88e77335486a51c04e87ab37b72e5701b711b6a4d7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
