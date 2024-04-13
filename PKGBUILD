# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRspongeR
_pkgver=2.6.0
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
md5sums=('145c70b6246eb437d83d3257b5eda98a')
b2sums=('31e9d882e4179753ed3e1353f81f76a9b7d7cd22c34e7a8f49c205b6d0f7320cfdf8d099b7236e60daf179aac4f443c8657e75a8e4553013acf3e0a19146d850')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
