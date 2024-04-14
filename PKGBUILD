# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sylly.en
_pkgver=0.1-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Language Support for 'sylly' Package: English"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-sylly
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('85f15e0ddadf21a5c51171114a9aced8')
b2sums=('8c1044933eddd3701f844ee9be0f598c9f9c27a2209d1c2d8ccf6e6dd243bca365d6d9a6619292c58632033cf45f67b2b16b51ea948eb92b3f7ae2742f02de91')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
