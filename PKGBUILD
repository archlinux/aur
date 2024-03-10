# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ismev
_pkgver=1.42
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="An Introduction to Statistical Modeling of Extreme Values"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('35d6f5fa7f29eb822d4efad81b3dd59e')
b2sums=('c87b907c13e55c16ecf71180fd66cf16ebce1cf225efa9139e30fa4953f275a18d8c33d02b5413cfc68ac1ef2ed8e9d09a29d5c81a60fc1989660a80cbb913f3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
