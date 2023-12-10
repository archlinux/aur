# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ReportingTools
_pkgver=2.42.3
pkgname=r-${_pkgname,,}
pkgver=2.42.3
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
sha256sums=('e8c0d86a2570add93957ed38a81486a0a8f4f9fa4df9c668765636a95bae3b81')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
