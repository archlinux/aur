# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IRISFGM
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Comprehensive Analysis of Gene Interactivity Networks Based on Single-Cell RNA-Seq"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-adaptgauss
  r-annotationdbi
  r-anocva
  r-clusterprofiler
  r-colorspace
  r-desingle
  r-drimpute
  r-ggplot2
  r-ggpubr
  r-ggraph
  r-igraph
  r-knitr
  r-mcl
  r-mixtools
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-pheatmap
  r-polychrome
  r-rcolorbrewer
  r-rcpp
  r-scater
  r-scran
  r-seurat
  r-singlecellexperiment
)
optdepends=(
  r-rmarkdown
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b42559d7909b71e4f258ceb0a759d6e5')
b2sums=('d156192400b3813e72f2d35e26f34f82bedcafb49297c1740c6cc09548ae788228aafa73f0006a0fbc6cbf44ddd17bdb060478bac6c1d02030100625e2a12cd8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
