# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mixsmsn
_pkgver=1.1-12
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fitting Finite Mixture of Scale Mixture of Skew-Normal Distributions"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-mvtnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6e7d62b6253beaf52a44f6ea075ca8ce')
b2sums=('be4cb96429a43e093b8844229fbc0703ca97b412ad0b56d882b6b9ca26ecdfbb5ca71e0248e087d7bedd8878080482873f68c91bc8949f3635d509f344924995')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
