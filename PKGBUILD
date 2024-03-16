# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=naivebayes
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="High Performance Implementation of the Naive Bayes Algorithm"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2786829c31702b6e7ded8f7cb74452e8')
b2sums=('3ce945133ac551763cbee1690046b47d1602b7ef846eeb0e3efd3bdbe8e41f20ef491ccf56fe5694b43b503d7a55eb5c783a384d75dcfd7ebcb6c2f9853b65b5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
