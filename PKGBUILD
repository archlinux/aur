# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sparsepca
_pkgver=0.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Sparse Principal Component Analysis (SPCA)"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-rsvd
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fbbc7e20a66da7f318e3d8f87791a201')
b2sums=('5a484f636279744d341f83c50280821b3fe72daee1de596a22e07f743879674f654e5935bfd29779980f2b9c1ff5251a94c45403f9396b378e1c59db959b3ad8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
