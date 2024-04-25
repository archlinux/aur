# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=COHCAP
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="CpG Island Analysis Pipeline for Illumina Methylation Array and Targeted BS-Seq Data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  perl
  r-bh
  r-cohcapanno
  r-gplots
  r-rcolorbrewer
  r-rcpp
  r-rcpparmadillo
  r-writexls
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6c7c601f8c8aee626d2fa1a6dd306dca')
b2sums=('197193446fa2ab53efec4cb688ca8690e7288e2efb44b56819a94057a9aa994815421a3adcb0b097781bd12008c2beb9998de6b37a48f3766e3276788b861365')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
