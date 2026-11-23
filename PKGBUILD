# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=celldex
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Index of Reference Cell Type Datasets"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-alabaster.base
  r-alabaster.matrix
  r-alabaster.se
  r-annotationdbi
  r-annotationhub
  r-dbi
  r-delayedarray
  r-delayedmatrixstats
  r-experimenthub
  r-gypsum
  r-jsonlite
  r-rsqlite
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-dt
  r-ensembldb
  r-jsonvalidate
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('daa4b4c65ab46e20f9cc57e692ddaafb')
b2sums=('8994c23cbe5fc67c4e782e5859459e9cea047183451b564be43668711853a055a5c8354d92267d52254e607f490571c2a605b22cd09faad823dff92c1e72622b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
