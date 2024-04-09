# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=optextras
_pkgver=2019-12.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Tools to Support Optimization Possibly with Bounds and Masks"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-numderiv
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fd03bbc4c2390d48216937e04f7cc026')
b2sums=('91be70c728ffdac7fba389143e9d40f281e9df23073fc289683ce6555dd767a53570c2af60d09a7e3d6a93d0237d84bea2620de2a96d4fcd64aecf29b1ea7d3f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
