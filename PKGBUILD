# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DMCHMM
_pkgver=1.30.1
pkgname=r-${_pkgname,,}
pkgver=1.30.1
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
sha256sums=('2cc5a9d519803b734a6c02e4301001d65fae1073744efcff88b0a84b108b56f5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
