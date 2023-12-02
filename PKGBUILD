# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DEGreport
_pkgver=1.38.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Report of DEG analysis"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
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
md5sums=('d7c43c419f87827c0a116e3ae905ead7')
sha256sums=('addc1c125c1e487262672797f3f04dd51d1d243fe82b191c3e21f0b0e09769ad')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
