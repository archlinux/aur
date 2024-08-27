# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SGCP
_pkgver=1.4.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="a spectral self-learning method for clustering genes in co-expression networks"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-annotate
  r-caret
  r-desctools
  r-dplyr
  r-expm
  r-genefilter
  r-ggplot2
  r-ggridges
  r-go.db
  r-gostats
  r-graph
  r-openxlsx
  r-org.hs.eg.db
  r-plyr
  r-rcolorbrewer
  r-reshape2
  r-rgraphviz
  r-rspectra
  r-summarizedexperiment
  r-xtable
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-devtools
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('41a65113ffafc44ba00d73c4d5691547')
b2sums=('30368802421fe2851d816aac1807d543a9cd85500b37816b6a8b62c38b334f77de1ad29374c749f169beecaafeb958ad0ac656c4b72eee0188e76cae687727e0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
