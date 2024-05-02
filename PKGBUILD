# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DEGreport
_pkgver=1.40.0
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
md5sums=('8e0448b69555460698f0a16b612c5e5b')
b2sums=('77baadc2d8afcdbf835049eca6380d4d8252896c290fd5c1b9a73b1f7cf49e76dbd603ee83cd4b3619d0b05980cf35dd0abcea5b452cebc441b70a6607e883aa')

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
