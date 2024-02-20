# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ANF
_pkgver=1.24.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Affinity Network Fusion for Complex Patient Clustering"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-igraph
  r-rcolorbrewer
)
optdepends=(
  r-experimenthub
  r-knitr
  r-rmarkdown
  r-snftool
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('56d73dcafe0bc643f70111fa5670c5f7')
b2sums=('dc18f5eefbe1eb06f82b21eb2bc3174b714d88ccb0d83b723b1e429372370a3305dbf109ccf443218cdcfbf78b12a107992a75ec3caebd619743b04faf21efc8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
