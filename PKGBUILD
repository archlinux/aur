# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geneRecommender
_pkgver=1.84.0
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
md5sums=('642d0318b2d5e5d5b70c79def27228e7')
b2sums=('d17b01613bc13f0aa089e391abd4d237f86d4e2383973bde7b1b1a17ca6746cc916b018c65086dafd173f64b643c320acd7fd00c17ddd6d0937090e737912cf6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
