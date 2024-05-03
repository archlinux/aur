# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DMCHMM
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Differentially Methylated CpG using Hidden Markov Model'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-calibrate
  r-fdrtool
  r-genomicranges
  r-iranges
  r-multcomp
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7e3979d2c85499126ef7d9081db906929e83bbd4c8482422eb6b1f6711d86167')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
