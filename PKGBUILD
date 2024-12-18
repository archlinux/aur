# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DominoEffect
_pkgver=1.26.0
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
md5sums=('fb13c8fd16dd9cd3426bc1c39b02447e')
b2sums=('5ce4ca5484aedfb0b28c131d4cb47a4c931543cd3ca8c6bc6ab10f200415defadbbeeb528bb0b580274a56a553b6b68473e9e7ba33aee9849e987bae5b2ce53e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
