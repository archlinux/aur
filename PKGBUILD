# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=smoothie
_pkgver=1.0-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Two-Dimensional Field Smoothing"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-fields
  r-spatialvx
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a57b76cf9b6622970b446c0aac8a8a64')
b2sums=('cba8b681a2b61768c6a3611adebabf084854905369e412de31b793722fcd9e9e7e781c253af08334b5f5cc366fa3b899c033dd6b830f7e7453280ba22ae110e5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
