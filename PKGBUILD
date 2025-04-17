# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=rbiom
_pkgver=2.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="Read/Write, Analyze, and Visualize 'BIOM' Data"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r-ape
  r-dplyr
  r-emmeans
  r-fillpattern
  r-ggbeeswarm
  r-ggnewscale
  r-ggplot2
  r-ggrepel
  r-ggtext
  r-jsonlite
  r-magrittr
  r-parallelly
  r-patchwork
  r-pillar
  r-plyr
  r-readr
  r-readxl
  r-slam
  r-vegan
)
optdepends=(
  r-cli
  r-crayon
  r-ggdensity
  r-glue
  r-labeling
  r-lifecycle
  r-openxlsx
  r-optparse
  r-pkgconfig
  r-prettycode
  r-r6
  r-rlang
  r-scales
  r-testthat
  r-tibble
  r-tsne
  r-uwot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cb7fbb3835196aba1f8675d0e1be7479')
b2sums=('2eefb6f04b2c98583264abfadb37ce23fd3f4535b902657740ddd7e2e0099657d4e2e00f7167be2813ba5723190d9345a100892d24259ef4f59c78531627be28')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
