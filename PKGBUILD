# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRspongeR
_pkgver=2.8.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identification and analysis of miRNA sponge regulation"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-clusterprofiler
  r-corpcor
  r-doparallel
  r-dose
  r-foreach
  r-igraph
  r-linkcomm
  r-mcl
  r-org.hs.eg.db
  r-rcpp
  r-reactomepa
  r-sponge
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('291beda79f86973458e8bc0f50130edf')
b2sums=('5549ae12f9a394e9b045efadc8ac89afeb531878f2cfe5e2acf8f2a4cb95d882522e3ad4e56f1837c07671cee7e9922c71e4f149c4157dbfa4805dbaf8246ad1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
