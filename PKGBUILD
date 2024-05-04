# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ATACCoGAPS
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analysis Tools for scATACseq Data with CoGAPS"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.mmusculus.ucsc.mm10
  r-chromvar
  r-cogaps
  r-dplyr
  r-fgsea
  r-geneoverlap
  r-genomicfeatures
  r-genomicranges
  r-gplots
  r-gtools
  r-homo.sapiens
  r-iranges
  r-jaspar2016
  r-motifmatchr
  r-msigdbr
  r-mus.musculus
  r-projectr
  r-rgreat
  r-stringr
  r-tfbstools
  r-tidyverse
)
optdepends=(
  r-knitr
  r-viridis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('17f4e21080e0488fab86b4fc5b2e6b15')
b2sums=('3bffcdf48133209b2245a070f297b2c43f725e881f5d01ff972087507b1fd4f5ce7c14327f5591c71770837c1f9241c62167af7614008bcf766cbe6fe3634b8c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
