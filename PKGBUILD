# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=STAN
_pkgver=2.26.2
pkgname=r-${_pkgname,,}
pkgver=2.26.2
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
sha256sums=('7b72748cb5e42f99f96eb34314230c3f047324d592680fb6c9762f15c582a435')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
