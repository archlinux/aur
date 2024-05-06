# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=strap
_pkgver=1.6-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Stratigraphic Tree Analysis for Palaeontology"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-ape
  r-geoscale
  r-pbapply
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8f13af1c2c6bfc38f8a52e5fedae4de4')
b2sums=('a0940060325f6e2132097d481a2c75e550cc53ee6b2d9eb85953bfbff145f16a24a56daa3250495a96b4a976cbff904a0dac604912ad9a9ffb6b9ccdd23d86a6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
