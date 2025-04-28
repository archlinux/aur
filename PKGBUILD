# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biomaRt
_pkgver=2.64.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interface to BioMart databases (i.e. Ensembl)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
  r-biocfilecache
  r-curl
  r-digest
  r-httr2
  r-progress
  r-rappdirs
  r-stringr
  r-xml2
)
optdepends=(
  r-biocstyle
  r-httptest2
  r-knitr
  r-mockery
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0443f953967c9ed6e4c5c5e8e7c72fb5')
b2sums=('4b788cf9d64adbed4a644ec50a3d0fc8c54d7c0e9b96d4fa9fbb611c5354654bea473453abdc2347a2b1aa9e58fcd153860adedf4c81a6058d072359b2851bed')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
