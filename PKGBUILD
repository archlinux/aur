# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rogue
_pkgver=2.2.0
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
md5sums=('8b4cf50f0b42d6264b227c8b03e0e747')
b2sums=('fbd0a10cd34e59c3d3aad80a59deef6ec3e7da4d9dfd33ec0c5ed28ec995d3ffdb48f945bdb162a253561997b7dda2c9692d8af30c9a3f9c2a9cc65322d66626')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
