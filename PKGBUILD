# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biomaRt
_pkgver=2.62.1
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
md5sums=('722924dcf24dadd2b61eb9130d02610c')
b2sums=('d794c703ef97eaeb06ae0eaa48e97060e80f272d4cc61a583c3d3ecd52c88e58d3a0219b7f2c1ea0018b4600b217968fc4ad72e03827e24e09200aa17805d43a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
