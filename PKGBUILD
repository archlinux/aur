# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nuCpos
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="An R package for prediction of nucleosome positions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-biostrings
  r-nupop
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b029b2678c784645c2198f00093bd923')
b2sums=('d1ef54b3702c6f6c902f2d8407d27e94d4e83d26e5ac3f87d7ad2e7421dfc02408e73322f0ae3848a650035f0b549ceafe32e32b602f78a043a05125935f8e70')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
