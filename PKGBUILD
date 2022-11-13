# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=methylCC
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Estimate the cell composition of whole blood in DNA methylation samples'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('CCPL:by-nc-sa')
depends=(
  r
  r-biobase
  r-bsseq
  r-bumphunter
  r-dplyr
  r-flowsorted.blood.450k
  r-genefilter
  r-genomicranges
  r-illuminahumanmethylation450kanno.ilmn12.hg19
  r-illuminahumanmethylation450kmanifest
  r-iranges
  r-magrittr
  r-minfi
  r-plyranges
  r-quadprog
  r-s4vectors
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-testthat
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b4f47e31294af20370f569fb5b0b4e04e76f8bf715ce32a4a3ba76216dd01f54')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
