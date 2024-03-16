# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NADA
_pkgver=1.6-1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=10
pkgdesc="Nondetects and Data Analysis for Environmental Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('387fc10823dd93bdfced5adeb7b9d710')
b2sums=('c714901ff26461c18a20d15bec6d0ce7752c36264fe18fb690631e583ccb0e7826f8330ab319e81f25f0f0c96440d64b10dfcd422cdcbbd265e286f2202d4584')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
