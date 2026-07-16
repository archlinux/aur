# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DominoEffect
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identification and Annotation of Protein Hotspot Residues"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-annotationdbi
  r-biomart
  r-biostrings
  r-data.table
  r-genomicranges
  r-iranges
  r-pwalign
  r-seqinfo
  r-summarizedexperiment
  r-variantannotation
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9f4b3c25191566334e4f08d4d6f9edc2')
b2sums=('4f95934d86fd084e587346f3a064854db1aa8f7233e70255afe6398eaebdc666cfc3ff48da27899c5593a8153381bf347fe87c2bffa50d32b2fe4b334d874ade')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
