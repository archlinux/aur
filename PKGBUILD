# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flashClust
_pkgver=1.01-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Implementation of optimal hierarchical clustering"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('23409aeeef98bf35d0b3d5dd755fdeff')
b2sums=('84d912c41082f74f88a69d3b48c365d92c07073305d7490134e9986f1b6cc447309bc1843de569660a510e64e8ae567aadc72dc8e4c37166ae5e3b64dd01dca2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
