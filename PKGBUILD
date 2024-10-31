# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RedeR
_pkgver=3.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interactive visualization and manipulation of nested networks"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  'java-runtime>=11'
  r-igraph
  r-scales
)
optdepends=(
  r-biocstyle
  r-knitr
  r-markdown
  r-rmarkdown
  r-treeandleaf
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ef1c2425218353186e59818411cca25d')
b2sums=('e6bd822dfd232eed74c3d1b263fe59e51b831a91f3792aec093f0fbcaa59abc0ef65d86b42f1a25ef19c2d4da69cadbecbbc0e594fd4fe1c9592ebbe4ab35b8a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
