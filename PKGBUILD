# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ExperimentHub
_pkgver=2.6.0
pkgname=r-${_pkgname,,}
pkgver=2.6.0
pkgrel=3
pkgdesc='Client to access ExperimentHub resources'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationhub
  r-biocfilecache
  r-biocgenerics
  r-biocmanager
  r-curl
  r-rappdirs
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-experimenthubdata
  r-hubpub
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ba84b86f66a6eebeeb1427615d9dc98152feadaf4bc438cd7b02fdc87bfde1c8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
