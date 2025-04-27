# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=msgbsR
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='msgbsR: methylation sensitive genotyping by sequencing (MS-GBS) R functions'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bsgenome
  r-easyrnaseq
  r-edger
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggbio
  r-ggplot2
  r-iranges
  r-plyr
  r-r.utils
  r-rsamtools
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-bsgenome.rnorvegicus.ucsc.rn6
  r-roxygen2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d767471d2bc3581fbe9e3a46d124dc2d98f977aa9e9a57b9fd0f525d005be7c8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
