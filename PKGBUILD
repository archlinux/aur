# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IMMAN
_pkgver=1.30.0
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
md5sums=('efe5f8663ec0ab8000c9c4e3b04ac0fe')
b2sums=('a99c94382ff6b8d4b1352ed88017f2f5ce59aea516229924c79bf3848b6736706f5166a24a772420b51b1fe77709c283002dd5984881fbffbc0d3e422a00ef1e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
