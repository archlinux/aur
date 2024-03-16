# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=logNormReg
_pkgver=0.5-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="log Normal Linear Regression"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('085a84c2a9e6d6c4c5ed87e063f0b42c')
b2sums=('514e24175e676b8f0c3328c01452d006156571038e5f02be0e46c937031a8b565c7ea6d528747894201e0bb59e821573561bb45cbf63b480e68444c106504683')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
