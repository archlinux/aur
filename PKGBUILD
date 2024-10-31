# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CNAnorm
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A normalization method for Copy Number Aberration in cancer samples"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-dnacopy
)
makedepends=(
  gcc-fortran
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ad9b870a77b07945bcd7c867c08fa04c')
b2sums=('6366206a02fb4ec29dd1f155e14c43e1a7826f34e96830203870e2f550ad182b8e3eefae429f2e4b8c0bc9ebb1c6d9628fa477468e5c41b3389f166f97d2be2d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
