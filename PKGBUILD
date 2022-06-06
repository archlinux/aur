# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SNPlocs.Hsapiens.dbSNP144.GRCh37
_pkgver=0.99.20
pkgname=r-${_pkgname,,}
pkgver=0.99.20
pkgrel=4
pkgdesc='SNP locations for Homo sapiens (dbSNP Build 144)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-bsgenome
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-s4vectors
)
optdepends=(
  r-biostrings
  r-bsgenome.hsapiens.ucsc.hg19
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3f8e047e5b27a95ae5bc7acbfb4de6aec6c6a65a9edda3eb915b863807e913fd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
