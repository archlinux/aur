# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Onassis
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=6
pkgdesc='OnASSIs Ontology Annotation and Semantic SImilarity software'
arch=('any')
url="https://bioconductor.org/packages/3.15/${_pkgname}"
license=('GPL')
depends=(
  r
  r-rjava
  r-onassisjavalibs
  r-geometadb
  r-rsqlite
  r-data.table
  r-annotationdbi
  r-rcurl
  r-dt
  r-knitr
  r-rtsne
  r-dendextend
  r-ggplot2
  r-ggfortify
  r-clusteval
)
makedepends=(
  git
  tar
)
optdepends=(
  r-biocstyle
  r-rmarkdown
  r-htmltools
  r-org.hs.eg.db
  r-gplots
  r-genomicranges
  r-kableextra
)
source=("git+https://git.bioconductor.org/packages/${_pkgname}.git")
sha256sums=('SKIP')

build() {
  tar -zcvf ${_pkgname}.tar.gz  ${_pkgname}
  R CMD INSTALL ${_pkgname}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
