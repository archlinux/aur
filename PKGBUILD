# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=seqArchRplus
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('e92db630da3de17bfeb536647b178e59')
b2sums=('026f8345d60ffdb792bb29b8d0eca27eb9f4a835ab4789e2f809885126757441f35a08ed5c04ea02e80c5d60744ef2001bd41855a776e317ff9e5a5790a0e434')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
