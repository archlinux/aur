# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lpNet
_pkgver=2.34.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Linear Programming Model for Network Inference"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-kegggraph
  r-lpsolve
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('98de40db5eda03f2ae3b35cf04c6882c')
b2sums=('1c248f30f0471c7a3fe31a2d79ca8cdc428d88e6b0f799366a0f2bf0b59dd599df45c9912d498d78cfc197cd259eea832841ebf7ea139b0f5f63440bb9d087a2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
