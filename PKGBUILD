# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biomaRt
_pkgver=2.69.3
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
  r-httr2
  r-progress
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
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1b92b7213aa13358c082aaa67dcb24fe')
b2sums=('5363f08ebcbd9bec9266cd897b439b29849279b86a61827cca2e0175c3231d19c858da169401df92321f8f273040115433a96af825286e2b05aac894b2c133a7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
