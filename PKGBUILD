# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=invgamma
_pkgver=1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The Inverse Gamma Distribution"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7edef60c90d4bbd2786b7c59f394f573')
b2sums=('b4075f332e998357c70586e0117121d4d6a53e78908cf1c271359225b5ed1351685158ab590d6beb01a19cde9c26cb1681fff1d07bc399e2e40a66cce83e8e4b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
