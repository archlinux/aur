# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=seqArchRplus
_pkgver=1.4.0
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
md5sums=('384b6ab7e09a3c997ec64c77ba988618')
b2sums=('5ba4309064764a334d35bc04bb01d5cd05376e06e80f0507bc921833b1fa5511865605f13ed2c4f6508a057dc8b7cf7810fc0fc149ac1a28593d854b94c70487')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
