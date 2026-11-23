# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BioTIP
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='BioTIP: An R package for characterization of Biological Tipping-Point'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-doparallel
  r-foreach
  r-genomicranges
  r-igraph
  r-psych
  r-scran
  r-stringr
)
optdepends=(
  r-base
  r-ggplot2
  r-knitr
  r-markdown
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('45a55d891ff7de621e5304e7f42851e33fed9357ee28c65129904ca5dfebdc0b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
