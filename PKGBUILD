# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRspongeR
_pkgver=2.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('52c6fe3ed5a289fd16c2e8c549402eb8')
b2sums=('6e52fe85bd718a33be2fe3b6448b9639a951e44a75b4097cbe35de09fbf53f989b5e12d1f6d06dd2ad1d3657b0cccc812b33e145a14f181beb5845881cf144c5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
