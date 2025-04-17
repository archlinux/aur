# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ANF
_pkgver=1.30.0
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
md5sums=('c9fcabc14f444d2727559be3f84d8801')
b2sums=('86ca01130e884a54d3a55125792e77177fa80a646b1b67da830b8fbd0c4ec384fdeb003d87223e782bed6a8bfbe5690a83b87ddeedb294353e64b03fc2ecfc4c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
