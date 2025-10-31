# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iClusterPlus
_pkgver=1.46.0
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
md5sums=('5224ba028f4c480d5abc5f3d769658b8')
b2sums=('ada2bdb0da92c26bdc531ba82acd2c28ca3c994b6b984b1a3cad55bce39798dedd81984b54237d7a7aa6b05162d70d2c22672903af46748ff2263b7d286ca325')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
