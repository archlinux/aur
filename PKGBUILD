# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MBA
_pkgver=0.1-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Multilevel B-Spline Approximation"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  r-bh
)
optdepends=(
  r-sp
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1b486bf2436bd2b6bdacce54d235cd91')
b2sums=('9931c1bea54b34848d23c3882bb68dc2398ea05c8e532d9436f8837e19f96f763c7aa76fe2d38a67949a79dc15c562583585b2dcde84216e40d8afc812f2572e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
