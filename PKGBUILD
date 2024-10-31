# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tRNAdbImport
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Importing from tRNAdb and mitotRNAdb as GRanges objects"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biostrings
  r-genomicranges
  r-httr2
  r-iranges
  r-modstrings
  r-s4vectors
  r-stringr
  r-structstrings
  r-trna
  r-xml2
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-httptest
  r-knitr
  r-rmarkdown
  r-rtracklayer
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('05c490998d3a1d2a552747d44958b6a0')
b2sums=('ec456b5646328b4c8435f9e36e91cd0c9bae94a95a8f8cb086743a0cca032a1c97a5f31c41d6c17ed9619e8fb4bac1266e18751e3cdcef65f74a5ee11231c273')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
