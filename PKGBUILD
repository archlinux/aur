# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=seqArchRplus
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Downstream analyses of promoter sequence architectures and HTML report generation"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-chipseeker
  r-cli
  r-clusterprofiler
  r-cowplot
  r-factoextra
  r-genomeinfodb
  r-genomicranges
  r-ggimage
  r-ggplot2
  r-gridextra
  r-heatmaps
  r-iranges
  r-magick
  r-rcolorbrewer
  r-s4vectors
  r-scales
  r-seqarchr
  r-seqpattern
)
optdepends=(
  r-biocstyle
  r-bsgenome.dmelanogaster.ucsc.dm6
  r-cager
  r-covr
  r-knitr
  r-org.dm.eg.db
  r-pdftools
  r-rmarkdown
  r-slickr
  r-txdb.dmelanogaster.ucsc.dm6.ensgene
  r-xfun
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9f20e2eed3e5b5a498564ea201b251d9')
b2sums=('1823f62e7c6203b0e048a47df9e49b93f393943f20a719b74e5802e368c1fdf87a157ee2d9899c7dfab92c30232ca5eccc55b68777ebc58c61b8982b83ceb799')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
