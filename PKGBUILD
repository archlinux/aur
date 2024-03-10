# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geeM
_pkgver=0.10.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Solve Generalized Estimating Equations"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-geepack
  r-mumin
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e493043dac3bd7c57b104ace2a6e19d7')
b2sums=('584fc4ee474abf2c53b7aa6b6a0f602c636eac3fa9d9b87e797aaa69c1d905b535eb8094e6e91608968a4d0227d5249650c17c4e41cecd80957829dfdd52180d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
