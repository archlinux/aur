# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=randPack
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Randomization routines for Clinical Trials"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7a78c6986a6576e91ca7b252d01aa20c')
b2sums=('237e554aded56827da1d46107f0e9cef22213e646cc1ceb97cf2a7aabe2896f0159f9c41a8c4138179f6b31552802a1bed899191213210494e91c5a6e926844f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
