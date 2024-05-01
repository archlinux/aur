# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ldblock
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='data structures for linkage disequilibrium measures in populations'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-httr
  r-rlang
)
optdepends=(
  r-biocstyle
  r-ensdb.hsapiens.v75
  r-ensembldb
  r-genomeinfodb
  r-genomicfiles
  r-gwascat
  r-knitr
  r-rmarkdown
  r-rsamtools
  r-runit
  r-snpstats
  r-variantannotation
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b034667e11832c3d1ea90f547653abd1928c304e40b6e4238d41927f571994d0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
