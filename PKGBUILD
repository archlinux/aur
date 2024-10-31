# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=twilight
_pkgver=1.82.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Estimation of local false discovery rate"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
optdepends=(
  r-golubesets
  r-vsn
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('75f8082dc238fcb07aa7a6793303681f')
b2sums=('e0b82eb8b70e89ce07810d98dbac52fa7c28b27d0d6b2d9a8ae6bba9738c71afcb15b616ac6761776c4635934ef422b73250c6ad2b6a71672ea5c0688031679d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
