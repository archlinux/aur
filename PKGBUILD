# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PCAN
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Phenotype Consensus ANalysis (PCAN)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('CCPL:by-nc-sa')
depends=(
  r
  r-biocparallel
)
optdepends=(
  r-biocstyle
  r-knitr
  r-reactome.db
  r-rmarkdown
  r-stringdb
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9f8138e78d6f13e4b98dcb39fe161edcd3d99a2d10814c1ae09fe7de0cd04979')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
