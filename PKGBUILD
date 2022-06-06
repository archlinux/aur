# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scTHI
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Indentification of significantly activated ligand-receptor interactions across clusters of cells from single-cell RNA sequencing data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-rtsne
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-scthi.data
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5bc57ca2d9aa4be5c1e14b836182145b44deed2d719326c8ea30864ba643f4c7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
