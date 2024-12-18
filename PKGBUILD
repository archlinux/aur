# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rcpi
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Molecular Informatics Toolkit for Compound-Protein Interaction in Drug Discovery"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biostrings
  r-curl
  r-doparallel
  r-foreach
  r-gosemsim
  r-httr2
  r-jsonlite
  r-rlang
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('83acc5f4a67a80de2d3ff48c06ff7cb1')
b2sums=('3ca843ef6a59e83ec2f830d7f005bb23485de711977cb9819da4cab4b791df23c807a546b2352ca08235ec96be25516ad51928ca23eac5223fe11a26eb153be1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
