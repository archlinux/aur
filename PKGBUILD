# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scTHI
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
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
sha256sums=('551de3d374630e298cd5bccb955f9996f8a54fb9dd037ea9c37af0fd7499141e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
