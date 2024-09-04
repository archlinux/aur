# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rcpi
_pkgver=1.40.2
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
  r-rjson
  r-rlang
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ef8e55efba48f75448c0f202eead4fa7')
b2sums=('979f05bc031d361e9d41a6ca9e5aea02d5cdc0cd315209c1bf594efca65cbd9818ea9fd1d554dff22e51747a8a236d39d25c9a13acb8346b21e54f5689c7219e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
