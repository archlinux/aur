# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tRNAdbImport
_pkgver=1.22.0
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
md5sums=('831409a4422a0cb29c3fce46c6f9c65c')
b2sums=('5b025596d111346fb84ef37a72230261e6d428e6ef3de512d4b5e025367ecd36dbebdfe5fe81a10749d7c2a06d2c75fe67f3bb51fd19cb4cfea57955f9c3f54f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
