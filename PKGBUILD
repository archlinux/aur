# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iClusterPlus
_pkgver=1.44.0
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
md5sums=('50a31290f8737c202e8524ac78ba5ad9')
b2sums=('7d84e814d2ba5e8d0fb5b49ec319790f8be7c2dcfc164ff51ad7e322c249b0ab375af6d9a200f64c1acaf4d0a2881cab4eafd38feaad4eb557d867679bcda4b9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
