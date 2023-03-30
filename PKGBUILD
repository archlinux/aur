# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AnnotationForge
_pkgver=1.40.2
pkgname=r-${_pkgname,,}
pkgver=1.40.2
pkgrel=1
pkgdesc='Tools for building SQLite-based annotation data packages'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-dbi
  r-rcurl
  r-rsqlite
  r-s4vectors
  r-xml
)
optdepends=(
  r-affy
  r-biocfilecache
  r-biocmanager
  r-biocstyle
  r-biomart
  r-biostrings
  r-genomeinfodb
  r-go.db
  r-hgu95av2.db
  r-homo.sapiens
  r-httr
  r-human.db0
  r-knitr
  r-markdown
  r-org.hs.eg.db
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8d1b474b2e15235b0ec80c9e426e462a795830fec96499259f14d2fc13b567a9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
