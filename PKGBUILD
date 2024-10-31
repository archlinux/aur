# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geneRecommender
_pkgver=1.78.0
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
md5sums=('8e6c386e1aaa70a6b04cda30cc0cbf92')
b2sums=('be5bbee94d38e5eca74780f24472d0aeb48d8166d1bbc482defdaa73533bc7caf96c8ed234ad4afd69f79b4cd3a5e21753696fd31d246792c9b0898c95bd5721')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
