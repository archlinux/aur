# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=rbiom
_pkgver=2.2.1
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
md5sums=('4019d8fb29d501a32362419b88320dc8')
b2sums=('16caaabed0e975e1ac0038cc15c0939b4b1a23ac0d372dfa21a94a1557482d86e800e37aaa855681ff29f9f6e60767a900a6d8ec07edf10e4f45c7ecd685a7f1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
