# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PCAN
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Phenotype Consensus ANalysis (PCAN)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('CCPL:by-nc-sa')
depends=(
  r
  r-biocparallel
)
optdepends=(
  r-biocstyle
  r-knitr
  r-reactome.db
  r-rmarkdown
  r-stringdb
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('196d4179bd36eb75123ce89db160b5bd9930afd00acdbcb681da78e6d28122bd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
