# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cpvSNP
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Gene set analysis methods for SNP association p-values that lie in genes in given gene sets'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocparallel
  r-corpcor
  r-genomicfeatures
  r-ggplot2
  r-gseabase
  r-plyr
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-reportingtools
  r-runit
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('51c9aaebe70bd6bf2a5706b5bf3c9837216a91485e23851f5380b02751b37c5f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
