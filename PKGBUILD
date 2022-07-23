# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cbaf
_pkgver=1.18.4
pkgname=r-${_pkgname,,}
pkgver=1.18.4
pkgrel=1
pkgdesc='Automated functions for comparing various omic data from cbioportal.org'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocfilecache
  r-cgdsr
  r-genefilter
  r-gplots
  r-openxlsx
  r-rcolorbrewer
  r-cbioportaldata
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3fc78735135d072eaf743d5107aa75e1bf6c8b4b5844e639911313b15ec412c7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
