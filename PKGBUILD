# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SICtools
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='Find SNV/Indel differences between two bam files with near relationship'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-doparallel
  r-genomicranges
  r-iranges
  r-matrixstats
  r-plyr
  r-rsamtools
  r-stringr
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c5b7c86610985a9cb4f1896f1ab3f0e02afa44749355ee03a56ce36e779e2db8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
