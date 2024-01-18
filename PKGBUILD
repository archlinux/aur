# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tRNAdbImport
_pkgver=1.20.1
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
md5sums=('800f0115cf3ffcfb1fd2dd45b3574f30')
b2sums=('d15c9797083b5c749a4accbf55659f5eb46c91ad05ee10dbf4ddf5ea4bf377d51b314ad2815297b750c2619ff45305d5ff25a6ff82d123238ae06032e3b3eb36')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
