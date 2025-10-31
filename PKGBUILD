# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NTW
_pkgver=1.60.0
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
md5sums=('74b8e8ee02dcddaa434e50606d566413')
b2sums=('38049c52eb2f1f7b1c263de914bc2f31edf031380ec41bef74c249714f2eca7d6a129372d3dc9f4c1d29e493374f1904866d64def7ccb7021bf9de72a8cde10c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
