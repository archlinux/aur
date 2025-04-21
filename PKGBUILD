# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tRNAdbImport
_pkgver=1.26.0
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
md5sums=('ac62740295581c726ee93cc441fe7669')
b2sums=('50288963eb2f33c92d137e0fee9b4eb2e82e727019f64a3a3782b44f894bbcceda83bbbd065805e6fc3dbdd0c0e55ed7666fab2abd6271d010d2315263610506')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
