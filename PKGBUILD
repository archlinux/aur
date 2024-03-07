# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pwr
_pkgver=1.3-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Basic Functions for Power Analysis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-scales
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8855e45d6dabfa18015f97bda4b40547')
b2sums=('a2b3c0deba52b158dbecfdf6f167d4a0470e10aabb3c3603cdee4176afc155ae8218f0a2fe18f43fed8be70b575226226018928cbf870c9bc0504f7b510a7bc0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
