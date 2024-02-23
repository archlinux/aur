# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rogue
_pkgver=2.1.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('141a2936bf39e506a24d3f8afff344ef')
b2sums=('d3bae972e933470e1733a05a704d4e90d870d28cd9456eaa9d209dc3f0cc178cdf5a6c4431089cb670fdc4e69e3d75548740e6d70f78a079bdac565327dcee8b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
