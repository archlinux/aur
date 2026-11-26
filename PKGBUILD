# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ldblock
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=1.44.0
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
  r-seqinfo
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
sha256sums=('8ac82eab13c6f2667b644f7c195cac9f6957475a682dbca15362668d37591cc2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
