# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IMMAN
_pkgver=1.26.0
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
md5sums=('d24a18ee9927aa1357ea998c764711a9')
b2sums=('722c360f49908015ed9d57efccd465660cc7006299448ba754447409bef7b32fe89a9087dfe646f817b31008a6f5431efdbe27f2379f9325a979117568504577')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
