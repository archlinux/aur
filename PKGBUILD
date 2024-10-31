# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pathwayPCA
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Integrative Pathway Analysis with Modern PCA Methodology and Gene Selection"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-lars
)
optdepends=(
  r-airway
  r-circlize
  r-knitr
  r-rcurl
  r-reshape2
  r-rmarkdown
  r-summarizedexperiment
  r-survminer
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0129956bd4573766d7168fcbf6d7d9a1')
b2sums=('6cb856fea30afd812e99f919c87978162ec1dd50cc3adb8d553835c2b6fb941ec6b767a08414d3f53185d11040a6a36c73e258cb62f667c1a4ab6585974af1c2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
