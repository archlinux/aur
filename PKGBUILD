# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DominoEffect
_pkgver=1.28.0
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
md5sums=('ebd345d5fac8ebb82082dc9cbe5b8dc1')
b2sums=('b4783934cd6c5b4f34d47019b8cf8ab805e4165d2cb67fffeb61af36180799a4cf073a36e9985337bf22bd548ceef38ad0a476e22e6bb2004385dc615bce8249')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
