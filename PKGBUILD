# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=edgeR
_pkgver=4.6.1
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
md5sums=('02aba730cb96778896b1a007f257e524')
b2sums=('a1d7ea4eb081ec92e81ab3663f02772be8c261ad56cd34f2650f87760dacdf6b71b1d8bd228f8f8c12733f4b71e338ead18c685aa71e6a76f13aef4ddb9af4a1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
