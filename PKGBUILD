# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=edgeR
_pkgver=4.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Empirical Analysis of Digital Gene Expression Data in R"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  lapack
  r-limma
  r-locfit
)
optdepends=(
  r-annotationdbi
  r-biobase
  r-biocstyle
  r-jsonlite
  r-knitr
  r-org.hs.eg.db
  r-readr
  r-rhdf5
  r-seuratobject
  r-summarizedexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cb9ead4c16515508ce0e2d91a7286b80')
b2sums=('5d2a7e7bd3c634df8bd4b73973ca266df16ad2f19d1717c39960136023bf04ed5606be065c2f8d69f832e120f1fabd0b329ced36ba93d21d111e1f843b16c19e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
