# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=celestial
_pkgver=1.4.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Collection of Common Astronomical Conversion Routines and Functions"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-nistunits
  r-pracma
  r-rann
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('aa1ad3e1f3252c636fc4904f22c83370')
b2sums=('fb0785a0bd01d4f1f3b65c59b33beb286443d72b4f8373f788abe123bb401dd23195f7007767eea3b7191ae61c43e1bdee9c4b913abacf3f290f16055d15fc50')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
