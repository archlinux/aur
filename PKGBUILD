# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeneExpressionSignature
_pkgver=1.58.0
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
md5sums=('a61f4816e1d78307c4431a79ee8ad5bc')
b2sums=('cf58203fa2583a9ca9da139a24f0390350ae7a4f3fa01e12d9a8d237a49d76ee2f319731263881e6ba401ba64f382e403c7eb5606ba10e65f4cd9ba196160a38')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
