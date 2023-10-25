# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSEAlm
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=1.62.0
pkgrel=1
pkgdesc='Linear Model Toolset for Gene Set Enrichment Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
)
optdepends=(
  r-all
  r-annotate
  r-category
  r-genefilter
  r-gostats
  r-gseabase
  r-hgu95av2.db
  r-multtest
  r-rcolorbrewer
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('08e34285f60eb07ceda3ce3e78a9f7be1afce4716f12d73efe168b7e5e91aa46')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
