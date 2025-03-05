# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=locfit
_pkgver=1.5-9.12
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Local Regression, Likelihood and Density Estimation"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-gam
  r-interp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('358f4fde91d135b36ec2a2331d75393b')
b2sums=('b2f0d5f2b20fefd7986eb7ae88ef6f4c103bd3ef99e0a7f502bdaea5eb4703f31f69e58bb4ef35bf688c2c3d66a7c8b0af81e2a84be145d9ce7aac4eb348af2e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
