# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RGSEA
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Random Gene Set Enrichment Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-biocgenerics
)
optdepends=(
  r-biocstyle
  r-geoquery
  r-knitr
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('907f598b5be82edd89806086374a4216')
b2sums=('b65eb07ed4a991106f8f01866aa5cc848d189bf845f7c4470c9e87c9fbe420dbcac82cbf17a011d600368033805ccadb4f610a35082877bf2ce94c6a411ad638')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
