# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GIGSEA
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genotype Imputed Gene Set Enrichment Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r-locfdr
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e3ee70ae0dfb103328c92a153ddc634c')
b2sums=('156169d3d4e47fd6fd74209b139f49d655120d16c18bafb9f26a2e889feaeb068eaae72613fc89fbe8b59ec566dee775159c6362b5d868fabea1d2a4ecbf0d23')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
