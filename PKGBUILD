# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=STAN
_pkgver=2.26.1
pkgname=r-${_pkgname,,}
pkgver=2.26.1
pkgrel=1
pkgdesc='The Genomic STate ANnotation Package'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-genomeinfodb
  r-genomicranges
  r-gviz
  r-iranges
  r-poilog
  r-rsolnp
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-gplots
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('479eff4ac3422d62ecbfb0f785ee837db02a85e530c0ef2ef0910158e02f9ee1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
