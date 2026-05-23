# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.geom
_pkgver=3.8-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Geometrical Functionality of the 'spatstat' Family"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-deldir
  r-polyclip
  r-spatstat.data
  r-spatstat.univar
  r-spatstat.utils
)
optdepends=(
  r-fftwtools
  r-spatstat
  r-spatstat.explore
  r-spatstat.linnet
  r-spatstat.model
  r-spatstat.random
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a49c661d0cde501c561b22c1d0a35fdd')
b2sums=('39e9e43fa9fd7b3ade9968497de109b9608b5fa52171a3f05d83f6c02b9e28df3e2ce8ac467f66e7151c2c0af5c6099d1adefc0b45880896988f72678c63f1b9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
