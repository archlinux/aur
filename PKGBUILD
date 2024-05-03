# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qsea
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='IP-seq data analysis and vizualization'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-genomeinfodb
  r-genomicranges
  r-gtools
  r-hmmcopy
  r-iranges
  r-limma
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-zoo
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-knitr
  r-mass
  r-medipsdata
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4dda648392db8ad4c1e56a3696ce1cd88ef161983078d08224f9b334ff892e90')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
