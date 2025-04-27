# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=INSPEcT
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Modeling RNA synthesis, processing and degradation with RNA-seq data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-deseq2
  r-desolve
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-plgem
  r-proc
  r-readxl
  r-rootsolve
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-shiny
  r-summarizedexperiment
  r-txdb.mmusculus.ucsc.mm9.knowngene
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('22f0b8bf75ae0530c37237f1de42dd94')
b2sums=('ce9763a3a8aa3d96ff1c88b77992e87aa9ec216fd45d566df48a8050389467d5b3fbd6687d86d04bb795e2b8bfa88f5e2cf024041a5a9b982f74558908ef4c59')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
