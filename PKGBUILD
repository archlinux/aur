# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=SNPassoc
_pkgver=2.1-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='SNPs-Based Whole Genome Association Studies'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-2.0-or-later')
depends=(
  r-ggplot2
  r-haplo.stats
  r-mvtnorm
  r-plyr
  r-poisbinom
  r-tidyr
)
optdepends=(
  r-biomart
  r-genomicranges
  r-iranges
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
  r-s4vectors
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-variantannotation
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('398070bec2a73f75ec861ba6897414ac')
b2sums=('c75c15cc38097abdaa32f9ce31812f78d35310c1be8ab73252ab93e3dd0f0f0989e10a301983ed824ef7a9fbcf968c41b18bcea7f88d2704a486f77a9f224ac6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
