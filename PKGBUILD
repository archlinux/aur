# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Bt.eg.db
_pkgver=3.19.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genome wide annotation for Bovine"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
)
optdepends=(
  r-annotate
  r-dbi
  r-runit
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('206921b50cfb937e1882d5de282028fb')
b2sums=('14e017ac9c07e98bd08269f137261e9d9b8ad85c843c55964e1d855098666e435b23eb3e380baf946c22c983253f5b2071ef1dcc10343433558fedc399d96124')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
