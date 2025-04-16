# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CNAnorm
_pkgver=1.54.0
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
md5sums=('0ef90d71e7539bf31fb40d12aad77c25')
b2sums=('798386f433a05f005899ce169cc8e44b36551cc84d7dc1fb873848bf930e2e7c14bfe5e811a1f592f4efbc0d9a6b12f01e57c91c5da3101ef23011fc40ae25cc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
