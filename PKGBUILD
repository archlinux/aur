# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=methylPipe
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Base resolution DNA methylation data analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-data.table
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-gplots
  r-gviz
  r-iranges
  r-marray
  r-rsamtools
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg18
  r-knitr
  r-methylseekr
  r-txdb.hsapiens.ucsc.hg18.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('002150c0d490ad15fad6efacb9cce108a26af198470d69c2a4a265099c34deab')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
