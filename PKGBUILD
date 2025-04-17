# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hypergraph
_pkgver=1.80.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A package providing hypergraph data structures"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-graph
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('47ffae10238d88157056acaed678195c')
b2sums=('d200965d4b11404ba0f2367acdb8d7881b052100c0aa7709dcf236fd370f664830f317d11ee7dd1259cce75292993175153d9acbfcbe3c635d164cb42abb79e7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
