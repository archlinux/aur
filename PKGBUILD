# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DEGreport
_pkgver=1.50.0
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
md5sums=('f9f13a0d52328a3a15430d143226aa7c')
b2sums=('b4264f70e271e3644e9c8babb7ef2e427985bf265e19decb3b71c72a2dca75891d7077b84740c9b3149f61bd18e00bc3dd364f7f556ba0816697a17c16dd8d80')

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
