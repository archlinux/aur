# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=specL
_pkgver=1.32.1
pkgname=r-${_pkgname,,}
pkgver=1.32.1
pkgrel=1
pkgdesc='specL - Prepare Peptide Spectrum Matches for Use in Targeted Proteomics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dbi
  r-protviz
  r-rsqlite
  r-seqinr
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fc13095a26380cb845277e82cc0e16c7dcbc8be8c1d8d640cf76994fd17d0e21')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
