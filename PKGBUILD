# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HDInterval
_pkgver=0.2.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Highest (Posterior) Density Intervals"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-coda
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('20e8122b31cc3c110d4a65ce4343ef8a')
b2sums=('2818aa2841a42b02cb71653d8f74a0925336106330655dd47d0d9d00f4cfd36705cfbd71af0fbca45289fa748092ecbf36f748debf762704504b2290a77b55ce')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
