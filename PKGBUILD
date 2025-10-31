# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geneRecommender
_pkgver=1.82.0
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
md5sums=('665f1b62d88011a175399e6ecb080293')
b2sums=('ae0bd0243d93fbc110158427e3e61ca39170a1044451dbdbf596a04229a886dd03cb85513397e5c17d1a764420b03bd0093f3de6e2aacf95799b708304aa76c7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
