
_pkgname=KEGGprofile
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='An annotation and visualization package for multi-types and multi-groups expression data in KEGG pathway'
arch=('any')
url="https://bioconductor.org/packages/3.12/bioc/html/KEGGprofile.html"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-png
  r-teachingdemos
  r-xml
  r-keggrest
  r-biomart
  r-rcurl
  r-ggplot2
  r-reshape2
  r-kegg.db
)
makedepends=(
  git
  tar
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
