# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DEGreport
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Report of DEG analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biobase
  r-biocgenerics
  r-broom
  r-circlize
  r-complexheatmap
  r-consensusclusterplus
  r-cowplot
  r-dendextend
  r-deseq2
  r-dplyr
  r-edger
  r-ggdendro
  r-ggplot2
  r-ggrepel
  r-knitr
  r-logging
  r-magrittr
  r-psych
  r-rcolorbrewer
  r-reshape
  r-rlang
  r-s4vectors
  r-scales
  r-stringi
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
)
optdepends=(
  r-annotationdbi
  r-biocstyle
  r-limma
  r-pheatmap
  r-rmarkdown
  r-statmod
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4c68c420c84dade04577ea3e19fa2643')
b2sums=('5e3ff2b7a4f8957e9e3e3b37916ffd3837abd9f796a7a3fa2c160c419a8ca94958910966f5e81c3d36b88abe1a29975ce5774ad38b029e0cc7f39a7231cb65f1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
