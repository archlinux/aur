# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cbaf
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Automated functions for comparing various omic data from cbioportal.org'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocfilecache
  r-cbioportaldata
  r-genefilter
  r-gplots
  r-openxlsx
  r-rcolorbrewer
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('119afd78a65b81bc4a5788ccf5878e9a737b950f4f6ecb70ee690931d08ec8fc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
