# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TBRDist
_pkgver=1.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Rearrangement Distances Between Unrooted Phylogenetic Trees"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-ape
  r-rdpack
  r-treedist
  r-treetools
)
makedepends=(
  r-bh
  r-rcpp
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7a06099570b709d23bba2ffc586f7ffc')
b2sums=('252f314b9a7a5685112e42826c39008ae52de5cd1ba6dc2d3af719aec21df533e69223373eda4a37784d36cdd5b2eb9eaeaf90bb7aae05f931879754552bd093')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
