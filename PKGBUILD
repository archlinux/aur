# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rgraphviz
_pkgver=2.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Provides plotting capabilities for R graph objects"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=(EPL)
depends=(
  r-graph
  zlib
)
optdepends=(
  r-biocgenerics
  r-runit
  r-xml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b93e5d1c383b1e5cd06e4dec89a43ce8')
b2sums=('dd8af61cef947ab217449352180b1fa222ca7a7b68bf22475d116207ea3837d7435fceab04d75eacbf75e35ac21d43db342c1e12b46c4604e6a95a8fb6194f1d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
