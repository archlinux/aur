# system requirements: Java 11, Cytoscape 3.8.2, Cy3D >= 1.1.3
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=transomics2cytoscape
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='A tool set for 3D Trans-Omic network visualization with Cytoscape'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-dplyr
  r-keggrest
  r-pbapply
  r-purrr
  r-rcy3
  r-tibble
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3e83bf4ad8792ce07b7799a81423101e69940083b56b5b9c7375a3a305cadee4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
