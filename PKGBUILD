# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ExperimentHub
_pkgver=2.8.1
pkgname=r-${_pkgname,,}
pkgver=2.8.1
pkgrel=1
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
sha256sums=('a4ee6ec522f941e5763885f7e60c24ffa55163a1db7f73ce96254194aca2a6d5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
