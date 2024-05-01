# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scTHI
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
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
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-scthi.data
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('01d5e3eef4f9fc98f8b71d640d7ff9fe62cd5985babb6dc4d8f88949a00b335d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
