# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=edgeR
_pkgver=4.6.3
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
  r-arrow
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4ef58857c2c864f5980f532d0291da9f')
b2sums=('3eb026aa60df4970ce4a9b9020d6ebb727aea81a60fa9eb3aa9d644b9654df845e88704b86c62e7fc816618c3e792bca1c02810a093c691792f8c39d00659cc6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
