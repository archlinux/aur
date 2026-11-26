# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeneExpressionSignature
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Gene Expression Signature based Similarity Metric"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
)
optdepends=(
  r-apcluster
  r-biocstyle
  r-geoquery
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b6e64da019afbf91ff3089579219705d')
b2sums=('bbb797c303361492001e9ebca299426b742c3b86bcc905e07456ae3c4cc1cfcfe9089aa1fd4f3cd3225a73fa0f9430e7b551cf515701f75ef566d29c8ccd09f6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
