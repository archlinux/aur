# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ReportingTools
_pkgver=2.39.0
pkgname=r-${_pkgname,,}
pkgver=2.39.0
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
sha256sums=('818a5c2d54988b29dfa43f0ad189189a698bf342ea38279003fe6cd71bde0796')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
