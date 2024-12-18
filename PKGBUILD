# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affycoretools
_pkgver=1.78.0
pkgname=r-${_pkgname,,}
pkgver=1.78.0
pkgrel=1
pkgdesc='Functions useful for those doing repetitive analyses with Affymetrix GeneChips'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-affy
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-dbi
  r-edger
  r-gcrma
  r-ggplot2
  r-glimma
  r-gostats
  r-gplots
  r-hwriter
  r-limma
  r-oligoclasses
  r-reportingtools
  r-rsqlite
  r-s4vectors
  r-xtable
)
optdepends=(
  r-affydata
  r-biocstyle
  r-hgfocuscdf
  r-hgu95av2.db
  r-knitr
  r-rgl
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2e1301a50c2bae6527a5cbbe23676bf35490d0b860e55285c438eb6b24b7caf7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
