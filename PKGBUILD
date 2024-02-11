# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ANF
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8d075ac90f30a9d8b2d98ed483ae8012')
b2sums=('5c7925a65eb89d5b3f302109a6b7657e95185fa99e311075e00d7f07345430e164f8e88de1355a3f8f53f8c699d245e140a6eae77a80d1e2807029be74b757fe')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
