# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=escape
_pkgver=2.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Easy single cell analysis platform for enrichment"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-ggdist
  r-ggplot2
  r-matrixgenerics
  r-summarizedexperiment
)
optdepends=(
  r-aucell
  r-biocparallel
  r-biocstyle
  r-delayedmatrixstats
  r-dplyr
  r-fgsea
  r-ggpointdensity
  r-ggraph
  r-ggridges
  r-gseabase
  r-gsva
  r-hexbin
  r-igraph
  r-irlba
  r-knitr
  r-msigdb
  r-patchwork
  r-rlang
  r-rmarkdown
  r-scran
  r-seurat
  r-seuratobject
  r-singlecellexperiment
  r-spelling
  r-stringr
  r-testthat
  r-ucell
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d6d019d875ac99da0568be20c87c4b53')
b2sums=('cf13de1883ff28f6ea69dd7b11a5b1907dbe6c1074fb667a9f0cd72c1b7fbc03596701297583d0525efa253ed8657b1777415ae7646922f9ed9e652095fdcfac')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
