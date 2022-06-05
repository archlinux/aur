# system requirements: Perl
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=COHCAP
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=1
pkgdesc='CpG Island Analysis Pipeline for Illumina Methylation Array and Targeted BS-Seq Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bh
  r-cohcapanno
  r-gplots
  r-rcolorbrewer
  r-rcpp
  r-rcpparmadillo
  r-writexls
  perl
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b2c806bb376ff9aab5c1eb048d66bd5f71e12b9414cfc3710f68c7d4af0ec973')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
