# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DominoEffect
_pkgver=1.24.0
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
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-pwalign
  r-summarizedexperiment
  r-variantannotation
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('75738ae6c59cfed0643a3bb2da6cd8cc')
b2sums=('12a601b4463ddaf4ab6e95eda0a274a5cdd8af2f0749011dc7455c72476e4517c7b6b59c7b96e9c182451fa1f1bc6e85a6b7bbf0978e85fa633aa942ff2d17e1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
