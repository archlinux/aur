# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iClusterPlus
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Integrative clustering of multi-type genomic data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  lapack
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('65bf4787b2705f9d30c243e2abbb068b')
b2sums=('d3bc1f838b5a42b49fd7276197f73a24aa89aea1bd4d72de743cd7297f93dfa0da2ccf2e9b4b05f595dcf0620726439abaedaa1c8ad9cf7f4e6fe9b0079654b5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
