# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TBRDist
_pkgver=2.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Rearrangement Distances Between Phylogenetic Trees"
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
md5sums=('24af6ab80cf9a62d6a841bb7de0bcb59')
b2sums=('1e90b68ca8a48771455775118e72a2c3c267bbade27b61985c44915c7162b223d49a1b6d3a427436416400592ac6cb9fc42381e622691e713e62923ab0cfa5b3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
