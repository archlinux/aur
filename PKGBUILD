# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ReportingTools
_pkgver=2.44.0
pkgname=r-${_pkgname,,}
pkgver=2.44.0
pkgrel=1
pkgdesc='Tools for making reports in various formats'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotate
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-category
  r-deseq2
  r-edger
  r-ggbio
  r-ggplot2
  r-gostats
  r-gseabase
  r-hwriter
  r-iranges
  r-knitr
  r-limma
  r-pfam.db
  r-r.utils
  r-xml
)
optdepends=(
  r-all
  r-hgu95av2.db
  r-markdown
  r-org.mm.eg.db
  r-org.sc.sgd.db
  r-pasilla
  r-rmarkdown
  r-runit
  r-shiny
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('27d0fd4af8a36a2a2500016e910bcb99ec34cd521571665c95358e2d6433046f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
