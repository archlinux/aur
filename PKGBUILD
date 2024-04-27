# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DEGreport
_pkgver=1.38.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('c244b736c180d78d142dd00938f7d40f')
b2sums=('8d4599d52db4b20b152b89f44869d5786c2904ddd6ab92715ec83988db20f7acf3f9cd20b2b3ffff9d9f816c03f208e0e285e5d165d28f6d94032c2eb29d93ce')

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
