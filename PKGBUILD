# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lpNet
_pkgver=2.40.0
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
md5sums=('3c503a2d55fc97727ac300b89f7d553a')
b2sums=('c0812f8c83c3d792f988c2ba1d0ecc9c266cdd23fe064d721e07bf7de9fd07f6117dbb9a74a56acfd0d052ab8a771300ac81d82ac5c5c7a99a2944715e8ba231')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
