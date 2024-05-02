# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geneRecommender
_pkgver=1.76.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A gene recommender algorithm to identify genes coexpressed with a query set of genes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fb32cf0e702e117ab4bb122b8fdc60f8')
b2sums=('618da31529b1b0a7fd6c73824c9a7a109200da13cc51d994bec7d3dd89e62c20984f97b1e29f4f5ab9cabcb1d6838df7b8465eb967c11cd84af37aca05fa011c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
