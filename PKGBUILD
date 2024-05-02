# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SeqSQC
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A bioconductor package for sample quality check with next generation sequencing data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-e1071
  r-experimenthub
  r-gdsfmt
  r-genomicranges
  r-ggally
  r-ggplot2
  r-iranges
  r-plotly
  r-rcolorbrewer
  r-reshape2
  r-rmarkdown
  r-s4vectors
  r-snprelate
)
optdepends=(
  r-biocstyle
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a39f0449ff4d9864a86ce8c1a49c9476')
b2sums=('8f1b4a8377d534f6ffd04230f17dd1fe8e47523e21833a1a759aff1db88be47250ad97ede10d92ea59b977d65b6980cbe4b2e0f9a5ad102d50c09bf86ae406b8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
