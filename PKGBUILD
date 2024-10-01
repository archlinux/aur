# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pegas
_pkgver=1.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Population and Evolutionary Genetics Analysis System"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-ape
)
optdepends=(
  r-adegenet
  r-rgl
  r-snpstats
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('95288acee475f26e94077b9962cc9848')
b2sums=('70fe3f83a55ea4ffc032a3b23b81ce4797bc4a1b486cbfdffd49099860e1f2e1153533c14d04e7592e3797e1bac85f8bfdc61bfdcf5d3de91b2f44ae56b1149b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
