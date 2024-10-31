# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=daMA
_pkgver=1.78.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Efficient design and analysis of factorial two-colour microarray data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('604d8b327a5ff84e4dfb0a73f18d7abb')
b2sums=('87537b52017fdd682ec02fc8212f3d7d5f62c3f27a2e894f602761dcabd2ad712b9bca95258889aa39e1c778ddeb5dd7f2b113f6d811571e2fae35a7ea612d81')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
