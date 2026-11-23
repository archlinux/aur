# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=SNPassoc
_pkgver=2.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='SNPs-Based Whole Genome Association Studies'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-2.0-or-later')
depends=(
  r-ggplot2
  r-mvtnorm
  r-plyr
  r-poisbinom
  r-rms
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
md5sums=('c3b1207026803e967917929dc3ba1fc1')
b2sums=('eed65f4837b549ddbd59cc0838200af594c96cf287fd06b64befe525e7e07996c9c5c8d70b0b5bb7b6b2091cae41cfa586c4377f83583f40d7e42fef658fca09')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
