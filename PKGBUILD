# system requirements: C++11, GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SAIGEgds
_pkgver=1.12.5
pkgname=r-${_pkgname,,}
pkgver=1.12.5
pkgrel=1
pkgdesc='Scalable Implementation of Generalized mixed models using GDS files in Phenome-Wide Association Studies'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-gdsfmt
  r-rcpp
  r-rcpparmadillo
  r-rcppparallel
  r-seqarray
  r-spatest
)
optdepends=(
  r-biocgenerics
  r-crayon
  r-ggmanh
  r-knitr
  r-markdown
  r-parallel
  r-rmarkdown
  r-runit
  r-snprelate
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('40589ff258b9f71715e6ca89e110bf598cfa5a2b1ad4cfe3919513e600988c81')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
