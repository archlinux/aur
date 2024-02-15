# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LowMACA
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Low frequency Mutation Analysis via Consensus Alignment"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  clustal-omega
  ghostscript
  perl-lwp-protocol-https
  perl-xml-simple
  r-biocparallel
  r-biostrings
  r-cbioportaldata
  r-data.table
  r-gridbase
  r-httr
  r-lowmacaannotation
  r-motifstack
  r-plyr
  r-rcolorbrewer
  r-reshape2
  r-stringr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/3.16/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('00d852771a79338dfdd5f41318672af1')
b2sums=('0e4e8ea737873f018fbc49dbf5502b45bde931b9f6fa19fc64cbd03015e627b75e92ed9aab184b43fa4102c65222a26db19145d9555f335f03f0181326640b62')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
