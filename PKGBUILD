# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IMMAN
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interlog protein network reconstruction by Mapping and Mining ANalysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-igraph
  r-pwalign
  r-seqinr
  r-stringdb
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('002a5c284a421462212720dc91f1c9f9')
b2sums=('9968e7361bf7e0e690fecac0daf6087ef7dba8809166388a11b24f067244578811ac68af6542921b610bee906675528ad11405b56bcf399eb3f6906ce7cc7b70')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
