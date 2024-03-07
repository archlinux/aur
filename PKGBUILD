# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=kpeaks
_pkgver=1.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Determination of K Using Peak Counts of Features for Clustering"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('67d7b4b6122fd5229bce53c96e8d47a2')
b2sums=('42862048ef83e5c4bacbece1bbb2e79049434056cf8d51b559019d3228225cca4b76f6e7a2478090ed86111f6848f739e6923747908804524c8b6a399d7e597e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
