# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rogue
_pkgver=2.1.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identify Rogue Taxa in Sets of Phylogenetic Trees"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-ape
  r-cli
  r-fastmatch
  r-matrixstats
  r-rdpack
  r-rfast
  r-treedist
  r-treetools
)
optdepends=(
  r-knitr
  r-plottools
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7f27f037ed14a157a027ae395abc2829')
b2sums=('bf6e026815f3838ff3fd0857cbb5c461c88d3d10a13af809618536dd45f6b11f777fdbbdfc30fc1387b3b6b1abbbf5c532873863549c865e1eb2a2d0b19a4326')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
