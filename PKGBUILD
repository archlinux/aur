# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biomaRt
_pkgver=2.62.0
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
md5sums=('405174e4e9aaafe96f14c5c3f4d43dcb')
b2sums=('67acfde8ec517e8d1d0b84b223cdf079da068d8e928a9e206297c755440a5c573bbbaee44fefcdb0564ff5fb0bd7aaa6ba100d1822eba87b61f2c4dab5f7afba')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
