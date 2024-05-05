# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=R2jags
_pkgver=0.8-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Using R to Run 'JAGS'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-abind
  r-coda
  r-r2winbugs
  r-rjags
  r-stringr
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f4daddcc2cafdecc9e53e6b88461ec7b')
b2sums=('c7a18ec417476690178a0b36d50a95e3bdfb6cd28cd8dccae0c80e5f2775e44ee9bd6b4c26b95607962da1592072d69bce02d5706ebe87fc713469e6391c232b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
