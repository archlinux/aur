# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ldblock
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
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
sha256sums=('3ec5de3d7c4f87c975ce725a29125d8f9d732d38a2ee221dd44209f2a3f0d404')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
