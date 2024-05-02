# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NTW
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Predict gene network using an Ordinary Differential Equation (ODE) based method"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-mvtnorm
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('26710a3d460bd35a15b527a2bcfc0dad')
b2sums=('a73733aae9fd48b0d19c8d7efa95b9bd8b363d3e0556dc053d5b87220e09dd02058969050eacdfee15cce73cbcaa0035ae0561e086dd9cc96e06821e410075d3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
