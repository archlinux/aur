# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRspongeR
_pkgver=2.10.0
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
md5sums=('cf7c860e44629876bb7c4d6cacc6635f')
b2sums=('26b79806af266db41536c8bba65c0e8b07cc01220732172ad5cc41074db7d765dcc54a76c6c8112f223f5a09aaaf7225f51b9fb0e343c37fbf7edace75c39ba9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
