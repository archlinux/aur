# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clusterStab
_pkgver=1.76.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Compute cluster stability scores for microarray data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
optdepends=(
  r-fibroeset
  r-genefilter
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3ff23e703f8ddac256c67de44947d217')
b2sums=('59408b971dde8dd1353b4581080ecc5bc4e9184d820c392e4f38aa8d36797c8caaa44a13a69d6237773e58a4f0e578169b19850ef0bd1a4b28d5fde157ba2dec')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
