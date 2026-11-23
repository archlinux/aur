# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRSM
_pkgver=2.8.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Inferring miRNA sponge modules in heterogeneous data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-bicare
  r-biobase
  r-clusterprofiler
  r-dbscan
  r-dose
  r-dynamictreecut
  r-energy
  r-fabia
  r-flashclust
  r-gfa
  r-gseabase
  r-igraph
  r-isa2
  r-matrixcorrelation
  r-mcl
  r-mclust
  r-nmf
  r-org.hs.eg.db
  r-pma
  r-ppclust
  r-rcolorbrewer
  r-rcpp
  r-reactomepa
  r-rjava
  r-sombrero
  r-summarizedexperiment
  r-wgcna
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7ed193525a814f85ad2cd809a1b20a67')
b2sums=('a03d2af12ad7637266087d167b29c0b711c4582df370c7b7ff686cee1150fc85dc36a2fb10cb6fb627530ef407489c227e72ea441e72539a829bb91c4a9d0963')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
