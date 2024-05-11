# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IMMAN
_pkgver=1.24.0
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
md5sums=('5d7082b60e3a0e4fc20e8c0ed492cf34')
b2sums=('8b689831bd426977e1f4ecb21aa9c70852b23a565c9717a270642c723a33420e91382470ed757eedf55b3fb34ea102828a3951c96ff33e97ca5c083be86851a0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
